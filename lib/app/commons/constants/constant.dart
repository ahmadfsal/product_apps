import 'package:flutter/material.dart';

class SharedConstant {
  static const String baseUrl = 'https://dummyjson.com/products';

  static String productList(int pageNumber, int pageSize) =>
      '$baseUrl?page[number]=$pageNumber&page[size]=$pageSize';

  static String productDetail(String giftId) => '$baseUrl/$giftId';

  static String addToWishlist(String giftId) => '$baseUrl/$giftId/wishlist';

  static const Color greenColor = Color(0xFF74B71B);
  static const Color grey = Color(0xFFD8D8D8);
  static const Color lightGrey = Color(0xFFBABBCD);
  static const Color isWishlist = Color(0xFFE7246B);

  static const String hiveCartBox = 'cart';
  static const String hiveCouponBox = 'coupon';

  static List<Map<String, dynamic>> listCoupon = [
    {'code': 'DISC10', 'discount': 10},
    {'code': 'DISC25', 'discount': 25},
    {'code': 'DISC50', 'discount': 50},
    {'code': 'DISCFREE', 'discount': 100},
  ];
}
