import 'package:flutter/material.dart';
import '../../utils/constants/color_constants.dart';

class TextStyles {
  static const String gotham = 'Gotham';
  static const String gothamBook = 'GothamBook';
  static const String gothamMedium = 'GothamMedium';

  static const TextStyle textStyle20BlackW500 = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyle15Black1 = TextStyle(
    fontSize: 15.0,
    color: Colors.black,
  );

  static const TextStyle textStyle12Black = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle textStyle12 = TextStyle(
      fontSize: 12,
      fontFamily: gothamBook,
      color: LightCodeColors.black1,
      fontWeight: FontWeight.w700,
    );

  static const TextStyle textStyle14 = TextStyle(
      fontSize: 14,
      fontFamily: gothamBook,
      color: LightCodeColors.black1,
      fontWeight: FontWeight.w700,
    );

  static const TextStyle underlinedTextStyle16 = TextStyle(
    decoration: TextDecoration.underline,
    fontFamily: gothamBook,
    fontSize: 16,
    color: LightCodeColors.blue1,
  );

  static const TextStyle textStyle20DarkBlue = TextStyle(
    fontFamily: gothamMedium,
    fontSize: 20,
    color: LightCodeColors.darkBlue,
  );

  static const TextStyle textStyle16DarkBlue = TextStyle(
    fontFamily: gothamBook,
    fontSize: 16,
    color: LightCodeColors.darkBlue,
  );

  static const TextStyle textStyle15White = TextStyle(
    fontFamily: gothamBook,
    fontSize: 15,
    color: Colors.white,
  );

  static const TextStyle textStyle15Black = TextStyle(
    fontFamily: gothamBook,
    fontSize: 15,
    color: LightCodeColors.black90,
  );

  static const TextStyle textStyle16White = TextStyle(
    fontFamily: gothamBook,
    fontSize: 16,
    color: Colors.white,
    letterSpacing: 1.5
  );

  static const TextStyle textStyle15Blue = TextStyle(
    fontFamily: gothamBook,
    fontSize: 15,
    color: Colors.blue,
  );

  static const TextStyle textStyle24DarkBlue = TextStyle(
    fontSize: 24,
    color: LightCodeColors.darkBlue,
    fontFamily: gothamMedium,
  );

  static const TextStyle textStyle22DarkBlue = TextStyle(
    fontSize: 22,
    color: LightCodeColors.darkBlue,
    fontFamily: gothamMedium,
  );

  static const TextStyle textStyle16Black1 = TextStyle(
    fontSize: 16,
    fontFamily: gothamMedium,
    color: LightCodeColors.black1,
  );

  static const TextStyle textStyle14Black1 = TextStyle(
    fontSize: 14,
    fontFamily: gothamMedium,
    color: LightCodeColors.black1,
  );

  static const TextStyle textStyle14Black1Const = TextStyle(
    color: LightCodeColors.black1,
    fontFamily: gothamMedium,
    fontSize: 14,
  );
}
