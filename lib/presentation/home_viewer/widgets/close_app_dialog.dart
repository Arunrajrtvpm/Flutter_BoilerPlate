import 'package:flutter/material.dart';

import '../../../utils/constants/string_constants.dart';

class CloseAppConfirmationDialog extends StatelessWidget {
  final Function onConfirmLogout;

  const CloseAppConfirmationDialog({super.key, required this.onConfirmLogout});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.areYouSure),
      content: const Text(Strings.areYouSureCloseApp),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(Strings.cancel),
        ),
        TextButton(
          onPressed: () {
            onConfirmLogout(); // Call the logout function when confirmed
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(Strings.close),
        ),
      ],
    );
  }
}
