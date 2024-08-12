import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.green,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}