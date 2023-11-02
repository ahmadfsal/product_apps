import 'package:intl/intl.dart';

class SharedHelper {
  static String formatRupiah([int price = 0]) {
    return NumberFormat.currency(decimalDigits: 0, locale: 'id_ID', name: 'Rp. ')
        .format(price);
  }
}
