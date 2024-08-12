import 'package:flutter/material.dart';

import '../../config/themes/text_styles.dart';
import '../../utils/constants/color_constants.dart';

class InAppCustomButton extends StatelessWidget {
  const InAppCustomButton(
      {super.key, required this.onPressed, required this.text});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 0.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          )),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(5)),
          backgroundColor: WidgetStateProperty.all<Color>(LightCodeColors.primaryColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.textStyle16White,
        ),
      ),
    );
  }
}

enum ButtonType {
  imageButton,
  elevatedButton,
}

class CustomButton extends StatelessWidget {
  final ButtonType type;
  final String label;
  final String? imagePath;
  final bool isDisabled;
  final bool isRow;
  final Function()? onPressed;

  const CustomButton({
    required this.type,
    required this.label,
    this.imagePath,
    this.isDisabled = false,
    this.isRow = false,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.4;
    if (isRow) {
      buttonWidth = MediaQuery.of(context).size.width * 0.4;
    }

    switch (type) {
      case ButtonType.imageButton:
        return Column(
          children: [
            InkWell(
              onTap: isDisabled ? null : onPressed,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.32,
                height: MediaQuery.of(context).size.width * 0.32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imagePath ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(label),
          ],
        );
      case ButtonType.elevatedButton:
        return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8.0), // Adjust the border radius as needed
            ),
            padding: const EdgeInsets.all(16.0),
            minimumSize:
                Size(buttonWidth, MediaQuery.of(context).size.height * 0.034),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isDisabled ? Colors.grey : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );

      default:
        return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          child: Text(
            label,
            style: TextStyle(
              color: isDisabled ? Colors.grey : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
    }
  }
}
