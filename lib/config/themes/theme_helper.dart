import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/config/themes/text_styles.dart';

import '../../utils/constants/color_constants.dart';

LightCodeColors get appThemeColor => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  /// Returns the colors for the current theme.
  LightCodeColors themeColor() => LightCodeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();

  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.lightCodeColorScheme;
    var sampleColorScheme = ColorScheme.fromSeed(
        seedColor: Colors.orangeAccent.shade400);

    return ThemeData(
      fontFamily: TextStyles.gotham,
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      useMaterial3: true,
    );
  }
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) =>
      const TextTheme(
        bodySmall: TextStyles.textStyle12Black,
        labelLarge: TextStyles.textStyle12,
        displayLarge: TextStyles.textStyle20DarkBlue,
        displayMedium: TextStyles.textStyle16DarkBlue,
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
      primary: LightCodeColors.primaryColor,
      onPrimary: LightCodeColors.darkBlue,
      onPrimaryContainer: LightCodeColors.lightOrange,
      secondary: LightCodeColors.black1);
}
