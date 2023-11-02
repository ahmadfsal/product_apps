import 'package:flutter_tech_test/app/domain/entity/product_list_entity.dart';

class ProductListModel extends ProductListEntity {
  ProductListModel({
    required int id,
    required String title,
    required String description,
    required int price,
    required double dicountPercentage,
    required double rating,
    required int stock,
    required String brand,
    required String category,
    required String thumbnail,
    required List<String> images,
  }) : super(
          brand: brand,
          category: category,
          description: description,
          dicountPercentage: dicountPercentage,
          id: id,
          images: images,
          price: price,
          rating: rating,
          stock: stock,
          thumbnail: thumbnail,
          title: title,
        );

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    double parseIntToDouble(dynamic value) {
      if (value is int) return value.toDouble();
      return value;
    }

    return ProductListModel(
      brand: json['brand'],
      category: json['category'],
      description: json['description'],
      dicountPercentage: json['discountPercentage'],
      id: json['id'],
      images: (json['images'] as List).map((e) => e as String).toList(),
      price: json['price'],
      rating: parseIntToDouble(json['rating']),
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      title: json['title'],
    );
  }
}
