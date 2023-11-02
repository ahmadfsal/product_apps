import 'package:dartz/dartz.dart';
import 'package:flutter_tech_test/app/commons/errors/errors.dart';
import 'package:flutter_tech_test/app/commons/usecase/usecase.dart';
import 'package:flutter_tech_test/app/domain/repositories/products_repository.dart';

class GetProductCategoriesUseCase implements UseCase<List<String>, dynamic> {
  final ProductsRepository _repository;

  GetProductCategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, List<String>>> call(dynamic value) async {
    return await _repository.getProductCategories();
  }
}
