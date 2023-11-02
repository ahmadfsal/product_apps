part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const PRODUCT_LIST = _Paths.PRODUCT_LIST;
  static const PRODUCT_DETAIL = _Paths.PRODUCT_DETAIL;
  static const CART = _Paths.CART;
  static const REDEEM = _Paths.REDEEM;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const PRODUCT_LIST = '/product-list';
  static const PRODUCT_DETAIL = '/product-detail';
  static const CART = '/cart';
  static const REDEEM = '/redeem';
}
