import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String toCurrency() {
    final formatter = NumberFormat.currency(decimalDigits: 2, symbol: '\$ ');
    return formatter.format(this);
  }
}
