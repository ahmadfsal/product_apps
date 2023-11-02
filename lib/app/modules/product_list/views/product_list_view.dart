import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tech_test/app/commons/helpers/helper.dart';
import 'package:flutter_tech_test/app/domain/entity/product_list_entity.dart';
import 'package:get/get.dart';
import '../controllers/product_list_controller.dart';

part './parts/appbar.dart';
part './parts/filter_category.dart';
part './parts/product_listing.dart';
part './parts/product_item.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Products Apps'),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchBar(),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilterCategory(),
                ProductListing(),
              ],
            ),
          ),
        );
      },
    );
  }
}
