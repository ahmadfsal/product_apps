import 'package:flutter/material.dart';
import 'package:flutter_tech_test/app/domain/entity/paging_entity.dart';
import 'package:flutter_tech_test/app/domain/entity/product_list_entity.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_product_categories_use_case.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_products_use_case.dart';
import 'package:get/get.dart';

const _kDefaultCategory = 'Semua Kategori';
const _kLimit = 10;

class ProductListController extends GetxController {
  final GetProductsUseCase _getProductsUseCase;
  final GetProductCategoriesUseCase _getProductCategoriesUseCase;

  final paging = Rxn<PagingEntity>();
  final searchController = TextEditingController();

  Rx<Params> params = Params().obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxString search = ''.obs;
  RxString selectedCategory = _kDefaultCategory.obs;
  RxList<String> categories = <String>[].obs;
  RxList<ProductListEntity> products = <ProductListEntity>[].obs;

  final ScrollController scrollController = ScrollController();

  ProductListController(
    this._getProductsUseCase,
    this._getProductCategoriesUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    initList();
    initCategories();
  }

  @override
  void onClose() {
    scrollController.addListener(scrollListener);
  }

  Future<void> initList() async {
    try {
      isLoading.value = true;
      await _getProductsUseCase
          .call(params.value)
          .then((either) => either.fold((l) => null, (r) {
                products.assignAll(r.productList!.toList());
                paging.value = r;
              }));
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void resetFilter() {
    selectedCategory.value = _kDefaultCategory;
    search.value = '';
    searchController.text = '';
    params.value = Params();
    initList();
    update();
  }

  Future<void> _loadMore() async {
    if (paging.value?.skip == 90) return;

    params.value = params.value.copyWith(skip: params.value.skip + _kLimit);

    await _getProductsUseCase
        .call(params.value)
        .then((either) => either.fold((l) => null, (r) {
              products.addAll(r.productList!.toList());
              paging.value?.total = r.total;
              update();
            }));
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  void onSelectCategory(String value) {
    selectedCategory.value = value;
    params.value = params.value.copyWith(category: value, skip: 0);
    initList();
    update();
  }

  void onChangeSearch(String value) {
    search.value = value;
    params.value = params.value.copyWith(search: value, skip: 0);
    initList();
    update();
  }

  Future<void> initCategories() async {
    try {
      await _getProductCategoriesUseCase
          .call(null)
          .then((either) => either.fold((l) => null, (r) {
                categories.addAll(r);
                update();
              }));
    } catch (e) {
      Exception(e.toString());
    }
  }

  bool get hasFilter {
    if (selectedCategory.value != '' &&
        selectedCategory.value != _kDefaultCategory &&
        search.value != '') {
      return true;
    }
    return false;
  }
}
