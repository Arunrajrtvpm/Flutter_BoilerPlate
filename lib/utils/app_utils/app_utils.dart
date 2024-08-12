import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/toast.dart';
import '../constants/string_constants.dart';

void closeKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus(); //close the keyboard if it is now open
}

bool isKeyboardOpen(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom > 0) {
    return true;
  } else {
    return false;
  }
}

launchURL(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    showToast(Strings.couldNotLaunchUrl);
  }
}
