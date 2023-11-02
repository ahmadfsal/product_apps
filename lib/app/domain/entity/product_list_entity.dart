class ProductListEntity {
  final int id;
  final String title;
  final String description;
  final int price;
  final double dicountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductListEntity({
    required this.brand,
    required this.category,
    required this.description,
    required this.dicountPercentage,
    required this.id,
    required this.images,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.title,
  });

  factory ProductListEntity.fromJson(Map<String, dynamic> json) {
    double parseIntToDouble(dynamic value) {
      if (value is int) return value.toDouble();
      return value;
    }

    return ProductListEntity(
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
