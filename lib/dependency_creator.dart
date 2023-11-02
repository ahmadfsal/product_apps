import 'package:dio/dio.dart';
import 'package:flutter_tech_test/app/data/data_source/remote_data_source.dart';
import 'package:flutter_tech_test/app/data/repositories/product_repository_impl.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Dio _dio = Dio();

    Get.lazyPut(() => RemoteDataSourceImpl(_dio), fenix: true);

    Get.lazyPut(
      () => ProductRepositoryImpl(Get.find<RemoteDataSourceImpl>()),
      fenix: true,
    );
  }
}
