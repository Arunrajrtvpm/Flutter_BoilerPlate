import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = "${now.day.toString().padLeft(2, '0')}/"
      "${now.month.toString().padLeft(2, '0')}/"
      "${now.year.toString().padLeft(2, '0')}";

  return formattedDate;
}

getOfsValue() {
  return "19800000";
}

getDateFromTmeStamp(millis) {
  if (millis == null) {
    return "";
  } else if (millis is String && millis.isEmpty) {
    return "";
  }
  try {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(millis.toString()));

// 24 Hour format:
    return DateFormat('dd/MM/yyyy hh:mm a').format(dt); // 31/12/2000, 22:00
  } catch (e) {
    return "";
  }
}

getHourFromTmestamp(millis) {
  if (millis == null) {
    return "";
  } else if (millis is String && millis.isEmpty) {
    return "";
  }
  try {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(millis.toString()));

// 24 Hour format:
    return DateFormat('hh:mm a').format(dt); // 31/12/2000, 22:00
  } catch (e) {
    return "";
  }
}

getOnlyDateFromTmestamp(millis) {
  if (millis == null) {
    return "";
  } else if (millis is String && millis.isEmpty) {
    return "";
  }
  try {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(millis.toString()));

// 24 Hour format:
    return DateFormat('dd/MM/yyyy').format(dt); // 31/12/2000, 22:00
  } catch (e) {
    return "";
  }
}
