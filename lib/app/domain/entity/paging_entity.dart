import 'package:flutter_tech_test/app/domain/entity/product_list_entity.dart';

class PagingEntity {
  int? total;
  int? skip;
  int? limit;
  List<ProductListEntity>? productList;

  PagingEntity({
    this.total,
    this.skip,
    this.limit,
    this.productList,
  });

  factory PagingEntity.fromJson(Map<String, dynamic> json) {
    return PagingEntity(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      productList: (json['products'] as List)
          .map((e) => ProductListEntity.fromJson(e))
          .toList(),
    );
  }
}
