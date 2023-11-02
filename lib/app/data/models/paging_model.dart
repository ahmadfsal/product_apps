import 'package:flutter_tech_test/app/data/models/product_list_model.dart';
import 'package:flutter_tech_test/app/domain/entity/paging_entity.dart';

class PagingModel extends PagingEntity {
  PagingModel({
    int? total,
    int? skip,
    int? limit,
    List<ProductListModel>? productList,
  }) : super(
          total: total,
          skip: skip,
          limit: limit,
          productList: productList,
        );

  factory PagingModel.fromJson(Map<String, dynamic> json) {
    return PagingModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      productList: (json['products'] as List)
          .map((e) => ProductListModel.fromJson(e))
          .toList(),
    );
  }
}
