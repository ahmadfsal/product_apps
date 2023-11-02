import 'package:dartz/dartz.dart';
import 'package:flutter_tech_test/app/commons/errors/errors.dart';
import 'package:flutter_tech_test/app/commons/usecase/usecase.dart';
import 'package:flutter_tech_test/app/domain/entity/paging_entity.dart';
import 'package:flutter_tech_test/app/domain/repositories/products_repository.dart';

class GetProductsUseCase implements UseCase<PagingEntity, Params> {
  final ProductsRepository _repository;

  GetProductsUseCase(this._repository);

  @override
  Future<Either<Failure, PagingEntity>> call(Params params) async {
    return await _repository.getProducts(params);
  }
}

class Params {
  int skip;
  int limit;
  String? search;
  String? category;

  Params({
    this.skip = 0,
    this.limit = 10,
    this.search,
    this.category,
  });

  Params copyWith({
    int? skip,
    int? limit,
    String? search,
    String? category,
  }) {
    return Params(
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      search: search ?? this.search,
      category: category ?? this.category,
    );
  }
}
