import 'package:dartz/dartz.dart';
import 'package:flutter_tech_test/app/commons/errors/errors.dart';
import 'package:flutter_tech_test/app/commons/errors/exceptions.dart';
import 'package:flutter_tech_test/app/data/data_source/remote_data_source.dart';
import 'package:flutter_tech_test/app/data/models/paging_model.dart';
import 'package:flutter_tech_test/app/domain/repositories/products_repository.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_products_use_case.dart';

class ProductRepositoryImpl extends ProductsRepository {
  final RemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PagingModel>> getProducts(Params params) async {
    try {
      PagingModel products = await _remoteDataSource.getProducts(params);

      return Right(products);
    } on ServerException {
      return Left(RemoteServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getProductCategories() async {
    try {
      List<String> categories = await _remoteDataSource.getProductCategories();

      return Right(categories);
    } on ServerException {
      return Left(RemoteServerFailure());
    }
  }
}
