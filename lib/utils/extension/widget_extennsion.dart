import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// An extension used to enhance the [Widget] class.
/// Without having to repeat so much code.
/// To use the extenstion you need to import the file.
/// On any widget of your choice you can add this extension by,
/// converting SizedBox(child:child) to SizedBox(child:child).lotusDefaultBorderRadius.
extension WidgetExtension on Widget {
  /// Adds a borderRadius to the widget used in the figma design.
  Widget get apxDefaultBorderRadius => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: this,
      );

  /// Allows to add custom borderRadius
  Widget apxBorderRadius(BorderRadius radius) => ClipRRect(
        borderRadius: radius,
        child: this,
      );

  /// Make the widget clickable.
  /// Provides a callback when the widget is clicked.
  Widget apxTouchable(
    VoidCallback onTap, {
    Color? splashColor,
    double? elevation,
  }) =>
      Material(
        color: Colors.transparent,
        elevation: elevation ?? 0,
        child: InkWell(
          splashColor: splashColor,
          onTap: onTap,
          child: this,
        ),
      );

  ///This extension adds padding to the given widget.
  ///It has a default padding for [24.w] horizontally and [16.h] vertically.
  Widget apxPadding([EdgeInsetsGeometry? padding, Widget? child] ) {
    return Padding(
      padding: padding ??
           EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
      child: child,
    );
  }
}