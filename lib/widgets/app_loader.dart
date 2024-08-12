import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white12),
      child: Center(
        child: CircularProgressIndicator(color: Colors.redAccent.shade100),
      ),
    );
  }
}
