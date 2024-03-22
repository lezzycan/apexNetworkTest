import 'package:flutter/material.dart';

class ApxColors {

 ApxColors._();

  /// Color Guide Notice (GREEN, RED, YELLOW, INFO COLOR)
  /// Ranging from (50-900)
  /// 50 = Light, 100 = Light :hover, 200 = Light :active,
  /// 300 = Normal, 400 = Normal :hover, 500 = Normal :active,
  /// 600 = Dark, 700 = Dark :hover, 800 = Dark :active, 800 = Darker

  /// Color Guide Notice (GREYS)
  /// Ranging from (50-900)
  /// 50 = Normal, 100 = Normal :hover, 200 = Normal :active,
  /// 300 = Dark, 400 = Dark :hover, 500 = Dark :active,
  /// 600 = Darker, 700 = Dark :hover, 800 = Dark :active, 800 = Darker

 static const Color primaryColor = Color(0XFF0a6375);
 static const Color focusBorderColor = Color(0XFF2FA2B9);
 static const Color secondaryColor = Color(0XFFFFB9AA);
 static const Color successColor = Color(0XFF4ADE80);
 static const Color warningColor = Color(0XFFFACC15);
 static const Color errorColor = Color(0XFFF75555);

 static const Color buttonColor = Color(0XFF111827);

 static const Color whiteColor = Color(0XFFFFFFFF);

  static const int _greyColorValue = 0xFF6B7280;

  static const Color backgroundColor = Color(0XFFF9FAFB);
  static const Color containerBorderColor = Color(0xffE5E7EB);

  static const Color iconColor = Color(0XFF9CA3AF);


  static const MaterialColor greyColor = MaterialColor(
    _greyColorValue,
    <int, Color>{
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD1D5DB),
      400: Color(0xFF9CA3AF),
      500: Color(_greyColorValue),
      600: Color(0xFF4BFF63),
      700: Color(0xFF374151),
      800: Color(0xFF1F2937),
      900: Color(0xFF111827),
    },
  );

}