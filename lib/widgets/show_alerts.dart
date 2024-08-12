import 'package:flutter/material.dart';

import '../utils/constants/string_constants.dart';

Future<void> showSingleActionButtonAlertDialog(
    {context,
    title = Strings.warning,
    message,
    positiveButtonMessage = 'Ok',
    positiveTap,
    dialogClosed}) async {
  return showDialog<void>(
    context: context,

    useSafeArea: true,
    barrierColor: Colors.grey.shade400.withOpacity(0.5),
    barrierDismissible: true,
    // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: <Widget>[
          TextButton(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.amber.shade800,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Text(
                positiveButtonMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (positiveTap != null) {
                positiveTap();
              }
            },
          )
        ],
      );
    },
  ).then((_) {
    dialogClosed();
  });
}

Future<void> showPermissionAlertDialog(
    {context,
    title = 'Warning',
    message,
    negativePositiveMessage = 'No',
    positiveButtonMessage = 'Yes',
    positiveTap,
    negativeTap,
    dialogClosed}) async {
  return showDialog<void>(
    context: context,

    useSafeArea: true,
    barrierColor: Colors.grey.shade400.withOpacity(0.5),
    barrierDismissible: false,
    // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          TextButton(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 1.0, color: Colors.amber.shade800),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Text(
                  negativePositiveMessage,
                  style: TextStyle(
                    color: Colors.amber.shade800,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                negativeTap();
              }),
          TextButton(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.amber.shade800,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Text(
                  positiveButtonMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                positiveTap();
              })
        ],
      );
    },
  ).then((_) {
    if (dialogClosed != null) dialogClosed();
  });
}
