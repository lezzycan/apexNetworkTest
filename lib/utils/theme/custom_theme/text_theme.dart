import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApxTextTheme {
  ApxTextTheme._();

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.sp, fontWeight: FontWeight.bold, color: ApxColors.buttonColor, ),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.sp, fontWeight: FontWeight.w600, color: ApxColors.buttonColor),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.sp, fontWeight: FontWeight.w600, color: ApxColors.buttonColor),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w600, color: ApxColors.buttonColor),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w500, color: ApxColors.buttonColor),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w400, color: ApxColors.buttonColor),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.sp, fontWeight: FontWeight.w500, color: ApxColors.buttonColor),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.sp, fontWeight: FontWeight.normal, color: ApxColors.buttonColor),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.sp, fontWeight: FontWeight.w400, color: ApxColors.buttonColor),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );

  /// Customizable Darkt Text Theme
  static TextTheme darktTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.sp, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.sp, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.sp, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
  );
}
