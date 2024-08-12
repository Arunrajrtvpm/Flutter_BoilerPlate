import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/app_constants.dart';
import '../utils/constants/string_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final bool isAccountID;
  final bool isCENumber;
  final bool fromAddCustomer;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isAccountID = false,
    this.isCENumber = false,
    this.fromAddCustomer = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: fromAddCustomer ? null : labelText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${_getFieldName()}';
        } else if (isEmail && !isValidEmail(value)) {
          return Strings.enterValidEmail;
        } else if (isPhone && !isValidPhoneNumber(value)) {
          return Strings.enterValidPhoneNumber;
        }
        return null;
      },
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : (isEmail
              ? TextInputType.emailAddress
              : (isPhone ? TextInputType.phone : TextInputType.text)),
      obscureText: isPassword,
      inputFormatters: isPassword
          ? []
          : (isPhone
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                      10), // Limit the phone number length
                ]
              : []),
    );
  }

  bool isValidEmail(String value) {
    return Constants.emailRegex.hasMatch(value);
  }

  bool isValidPhoneNumber(String value) {
    return Constants.phoneRegex.hasMatch(value);
  }

  String _getFieldName() {
    if (isPassword) {
      return 'a password';
    } else if (isEmail) {
      return 'an email';
    } else if (isPhone) {
      return 'a phone number';
    } else if (isAccountID) {
      return 'an Account ID';
    } else if (isCENumber) {
      return 'a CE Number';
    } else {
      return 'a value';
    }
  }
}
