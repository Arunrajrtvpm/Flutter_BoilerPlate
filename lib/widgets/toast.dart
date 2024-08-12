import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/constants/enums.dart';

showToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showSnackBar(ToastStyle? style, BuildContext context, String message) {
  var backgroundColor = Colors.lightBlue.shade800;
  switch (style ?? ToastStyle.error) {
    case ToastStyle.success:
      {
        backgroundColor = Colors.green.shade600;
      }
      break;
    case ToastStyle.error:
      {
        backgroundColor = Colors.red.shade600;
      }
      break;
    case ToastStyle.info:
      {
        backgroundColor = Colors.lightBlue.shade800;
      }
      break;
    case ToastStyle.warn:
      {
        backgroundColor = Colors.orange.shade800;
      }
      break;
  }
  var snackBar = SnackBar(
      elevation: 8,
      duration: const Duration(milliseconds: 800),
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      content: Text(message,
          style: const TextStyle(
            color: Colors.white,
          )),
      action: SnackBarAction(
          label: "X", textColor: Colors.white, onPressed: () {}));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
