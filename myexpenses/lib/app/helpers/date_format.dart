import 'package:intl/intl.dart';

String dateFormat(DateTime date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final String formatted = formatter.format(date);
  return formatted;
}
