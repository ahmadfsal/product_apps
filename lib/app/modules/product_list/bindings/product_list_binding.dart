import 'package:flutter_tech_test/app/data/repositories/product_repository_impl.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_product_categories_use_case.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_products_use_case.dart';
import 'package:flutter_tech_test/app/modules/product_list/controllers/product_list_controller.dart';
import 'package:get/get.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetProductsUseCase(Get.find<ProductRepositoryImpl>()));
    Get.lazyPut(
        () => GetProductCategoriesUseCase(Get.find<ProductRepositoryImpl>()));
    Get.lazyPut<ProductListController>(
      () => ProductListController(
        Get.find<GetProductsUseCase>(),
        Get.find<GetProductCategoriesUseCase>(),
      ),
    );
  }
}
