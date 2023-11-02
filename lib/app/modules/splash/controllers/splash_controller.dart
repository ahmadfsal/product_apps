import 'dart:async';

import 'package:flutter_tech_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _toProductList();
  }

  void _toProductList() {
    Timer(const Duration(seconds: 2),
        () => Get.offAndToNamed(Routes.PRODUCT_LIST));
  }
}
