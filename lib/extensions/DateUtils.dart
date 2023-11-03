import 'package:intl/intl.dart';

extension DateTimeParsing on DateTime {
  String parseToDate() {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(this);
    return formatted;
  }
}

