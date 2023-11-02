import 'package:dio/dio.dart';
import 'package:flutter_tech_test/app/commons/constants/constant.dart';
import 'package:flutter_tech_test/app/commons/errors/exceptions.dart';
import 'package:flutter_tech_test/app/data/models/paging_model.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_products_use_case.dart';

abstract class RemoteDataSource {
  Future<PagingModel> getProducts(Params params);
  Future<List<String>> getProductCategories();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _dio;

  RemoteDataSourceImpl(this._dio);

  @override
  Future<PagingModel> getProducts(Params params) async {
    try {
      String url = SharedConstant.baseUrl;

      if (params.search != null) {
        url += '/search?q=${params.search}';
      }

      if (params.category != null) {
        url += '/category/${params.category}';
      }

      Response response = await _dio.get(url, queryParameters: {
        'skip': params.skip,
        'limit': params.limit,
      });

      return PagingModel.fromJson(response.data);
    } on DioError catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getProductCategories() async {
    try {
      Response response = await _dio.get(
        '${SharedConstant.baseUrl}/categories',
      );

      return (response.data as List).map((e) => e as String).toList();
    } on DioError catch (_) {
      throw ServerException();
    }
  }
}
