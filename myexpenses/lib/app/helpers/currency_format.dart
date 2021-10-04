import 'package:intl/intl.dart';

String currencyFormat(double value) {
  NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt-BR');
  String formatted = formatter.format(value);
  return formatted;
}
