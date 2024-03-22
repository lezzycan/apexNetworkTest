import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApxTextFormFieldWidget extends StatelessWidget {
  const ApxTextFormFieldWidget({
    super.key,
    this.title,
    this.contentPadding,
    this.backgroundColor,
    this.focusNode,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.prefix,
    this.keyboardType,
    this.hintTextStyle,
    this.textInputAction,
    this.hintText,
    this.textAlignPosition,
    this.inputFormatters,
    this.focusBorderWidth,
    this.focusColor,
    this.borderWidth,
    this.borderColor,
    this.enabled,
    this.validator,
    this.borderRadius,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.maxLines,
    this.borderSide, this.onTap, this.redOnly,
  });
  final String? title;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final TextStyle? hintTextStyle;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextAlign? textAlignPosition;
  final List<TextInputFormatter>? inputFormatters;
  final double? focusBorderWidth;
  final Color? focusColor;
  final double? borderWidth;
  final Color? borderColor;
  final int? maxLines;
  final bool? enabled;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final BorderSide? borderSide;
  final void Function()? onTap;
  final bool? redOnly;
  @override
  Widget build(BuildContext context) {
    return 
     
          TextFormField(
            onTap: onTap,
            autofocus: false,
            focusNode: focusNode,
            validator: validator,
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            controller: controller,
            enabled: enabled,
            readOnly: redOnly  ?? false,
            maxLines: 1,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ApxColors.buttonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Axiforma'),
            textAlign: textAlignPosition ?? TextAlign.left,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              isDense: true,
             
              prefix: prefix,
              suffixIcon: suffixIcon,
              suffixIconColor: suffixIconColor ?? ApxColors.greyColor[400],
              prefixIcon: prefixIcon,
              prefixIconColor: prefixIconColor ?? ApxColors.greyColor[400],
              filled: true,
              contentPadding: contentPadding,
              fillColor:
                  backgroundColor ?? const Color(0XFFF9FAFB),
              hintText: hintText,
              hintStyle: hintTextStyle ??  TextStyle(
                fontFamily: 'SF Pro Display', fontSize: 16.sp, color:const Color(0XFF9CA3AF), fontWeight: FontWeight.w400
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    width: focusBorderWidth ?? 1.0,
                    color: ApxColors.focusBorderColor,
                  )),
              enabled: enabled ?? true,
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16.r),
                borderSide: borderSide ??
                    BorderSide(
                      width: borderWidth ?? 1.0,
                      color: borderColor ??
                          const Color(0XFFF9FAFB),
                    ),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16.r),
                borderSide: borderSide ??
                    BorderSide(
                      width: borderWidth ?? 1.0,
                      color: borderColor ??
                          const Color(0XFFF9FAFB),
                    ),
              ),
            ),
          );
        
      
  }
}