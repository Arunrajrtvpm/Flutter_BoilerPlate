import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/themes/theme_helper.dart';

import '../../config/themes/text_styles.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/constants/string_constants.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final Function onConfirmLogout;

  const LogoutConfirmationDialog({super.key, required this.onConfirmLogout});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        Strings.confirmLogout,
        style: theme.textTheme.displayLarge,
      ),
      content: Text(Strings.logoutMsg, style: theme.textTheme.displayMedium),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child:
              const Text(Strings.cancel, style: TextStyles.textStyle15Black1),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            onConfirmLogout();
          },
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(LightCodeColors.maroon2),
          ),
          child: const SizedBox(
            width: 60,
            child: Center(
              child: Text(
                Strings.logout,
                style: TextStyles.textStyle15White,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
