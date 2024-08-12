import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final String imagePath;
  final double size;

  const CustomLogo({super.key, required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
