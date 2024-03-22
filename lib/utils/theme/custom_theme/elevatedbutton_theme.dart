import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LElevatedButtonTheme {
  LElevatedButtonTheme._();

  /// ----- Light Theme

  static final lightElevatedButtonTheme =  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: ApxColors.buttonColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side:  const BorderSide(color:  ApxColors.buttonColor,),
        padding: const EdgeInsets.all( 8),
        textStyle:  TextStyle(fontSize: 16.sp, color: Colors.white,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r))
      )
  );

  /// ----- dark Theme
   

   static final darkElevatedButtonTheme =  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.all( 8),
        textStyle: const TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r))
      )
  );
}
