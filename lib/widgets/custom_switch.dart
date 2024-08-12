import 'package:flutter/material.dart';

import '../../utils/constants/color_constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final IconData enabledIcon;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.enabledIcon,
  });

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 50.0, // Adjust width as needed
        height: 30.0, // Adjust height as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.value ? LightCodeColors.maroon : LightCodeColors.grey2,
        ),
        child: Stack(
          children: [
            Align(
              alignment:
                  widget.value ? Alignment.centerRight : Alignment.centerLeft,
              child: Icon(
                widget.enabledIcon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
