import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
 const CustomButton(
      {super.key,
      required this.onPressed,
     
      this.height,
      this.width,
      this.border,
      this.backGroundColor,
       required this.child});

  final Function()? onPressed;

  final double? height;
  final double? width;
  final Border? border;
  final Color? backGroundColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
         height: height ?? 40.h,
         alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
         borderRadius:
           BorderRadius.circular(10.r),
           border:border ,
           color:   backGroundColor ?? ApxColors.buttonColor, 
            
        ),
        child: child,
      
      ),
    );
  }
}
