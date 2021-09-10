import 'package:intl/intl.dart';

import '../domain/managers/date_manager.dart';

class DateManagerImp implements DateManager {
  @override
  String reformatDateString(
      String dateString, String oldFormat, String newFormat) {
    if (dateString.isEmpty) return '';
    DateTime date = DateFormat(oldFormat).parse(dateString);
    return DateFormat(newFormat).format(date);
  }
}
