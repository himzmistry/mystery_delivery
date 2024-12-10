import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtility {
  static const String yyyyMMdd = 'yyyy-MM-dd';
  static const String jm = 'jm';

  getFormattedDate(DateTime? dateTime, {String dateFormat = yyyyMMdd}) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat(dateFormat).format(dateTime);
  }

  getDateTimeFormString(String date, {String dateFormat = yyyyMMdd}) {
    if (date == '') {
      return null;
    }
    return DateFormat(dateFormat).parse(date);
  }

  static Future<DateTime?> selectDate(BuildContext context,
      {DateTime? startDate, DateTime? endDate, DateTime? initialDate}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate ?? DateTime.now(),
        firstDate: startDate ?? DateTime(2015, 8),
        lastDate: endDate ?? DateTime(2101));
    return picked;
  }

  static String intToTimeLeft(int value) {
    print('value: $value');
    int h, m, s;

    h = value ~/ 3600;
    print('h: $h');
    m = ((value - h * 3600)) ~/ 60;
    print('m: $m');
    s = value - (h * 3600) - (m * 60);
    print('s: $s');
    String formatHr = '';
    if (m < 10) {
      formatHr = '$h';
    } else {
      formatHr = '$h';
    }
    print('formatHr: $formatHr');
    String formatMin = '';
    if (m < 10) {
      formatMin = '0$m';
    } else {
      formatMin = '$m';
    }
    String formatSec = '';

    if (s < 10) {
      formatSec = '0$s';
    } else {
      formatSec = '$s';
    }
    String result = '';
    try {
      if (int.parse(formatHr) > 0) {
        result = "$formatHr:$formatMin:$formatSec";
      } else {
        result = "$formatMin:$formatSec";
      }
    } catch (e) {
      print('intToTimeLeft: $e');
    }

    return result;
  }
}
