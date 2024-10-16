import 'package:flutter_boilerplate/utils/constants/app_constants.dart';
import 'package:intl/intl.dart';

/// Gets the current date formatted as DD/MM/YYYY.
String getCurrentFormattedDate() {
  final now = DateTime.now();
  final formattedDate = DateFormat(Constants.dateFormatWithoutTime).format(now);
  return formattedDate;
}

/// Gets a formatted date string from a timestamp in milliseconds.
String getFormattedDateFromTimestamp(int milliseconds) {
  if (milliseconds == null || milliseconds.toString().isEmpty) {
    return "";
  }
  try {
    final dt = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    final formattedDate = DateFormat(Constants.dateFormatWithTime).format(dt);
    return formattedDate;
  } catch (e) {
    return "";
  }
}
