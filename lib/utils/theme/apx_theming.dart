import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/theme/custom_theme/elevatedbutton_theme.dart';
import 'package:apex/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class ApxThemeManager {
  ApxThemeManager._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Axiforma',
    brightness: Brightness.light,
    primaryColor: ApxColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ApxTextTheme.lightTextTheme,
    elevatedButtonTheme: LElevatedButtonTheme.lightElevatedButtonTheme,
  );
}
