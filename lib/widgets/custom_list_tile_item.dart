import 'package:flutter/material.dart';

import '../../utils/constants/color_constants.dart';

class CustomImageAvatarWidget extends StatelessWidget {
  const CustomImageAvatarWidget({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: LightCodeColors.lightOrange,
            boxShadow: [
              BoxShadow(color: LightCodeColors.lightGrey, blurRadius: 6),
            ]),
        child: CircleAvatar(
            backgroundImage: Image.asset(
          path,
          width: 25,
          height: 25,
        ).image));
  }
}
