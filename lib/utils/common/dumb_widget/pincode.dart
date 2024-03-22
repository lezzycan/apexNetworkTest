import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeWidget extends StatelessWidget {
  const PincodeWidget({super.key, required this.controller, this.onComplete, this.shape, required this.focusNode, this.obscureText});
 final TextEditingController controller;
 final Function(String)? onComplete;
 final PinCodeFieldShape? shape;
 final FocusNode focusNode;
 final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
                    controller: controller,
                    appContext: context,
                    backgroundColor: ApxColors.backgroundColor,
                    
                    length:5,
                    blinkWhenObscuring: true,
                    cursorColor: Colors.black,
                    obscureText: obscureText ?? false,
                     validator: context.validateFieldNotEmpty,
                    animationType: AnimationType.fade,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    focusNode: focusNode,
                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                      borderRadius: BorderRadius.circular(5),
                      shape: shape ?? PinCodeFieldShape.box,
                      fieldHeight: 50.w,
                      fieldWidth: 50.w,
                      
                      activeBorderWidth: 1.0,
                      selectedBorderWidth: 1.0,
                      borderWidth: 1.0,
                      inactiveBorderWidth: 1.0,
                      selectedColor: ApxColors.greyColor,
                      activeFillColor: ApxColors.backgroundColor,
                      inactiveColor: ApxColors.greyColor,
                      activeColor: ApxColors.primaryColor,
                      inactiveFillColor: Colors.transparent,
                      selectedFillColor: ApxColors.whiteColor,
                    ),
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    onCompleted: onComplete,
                    autoDisposeControllers: false,
                    autoDismissKeyboard: false,
                    autoFocus: true,
                    // onChanged: on,
                  
                  );
  }
}