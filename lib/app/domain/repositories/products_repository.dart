import 'package:dartz/dartz.dart';
import 'package:flutter_tech_test/app/commons/errors/errors.dart';
import 'package:flutter_tech_test/app/data/models/paging_model.dart';
import 'package:flutter_tech_test/app/domain/usecase/get_products_use_case.dart';

abstract class ProductsRepository {
  Future<Either<Failure, PagingModel>> getProducts(Params params);
  Future<Either<Failure, List<String>>> getProductCategories();
}
