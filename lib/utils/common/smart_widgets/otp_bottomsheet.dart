import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpBottomSheet extends StatelessWidget {
  const OtpBottomSheet(
      {super.key, required this.controller, required this.onComplete, this.headline, this.subHeadline, this.length});
  final TextEditingController controller;
  final Function(String) onComplete;
 final  String? headline;
 final String? subHeadline;
 final int? length;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: ApxColors.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ApxSpacing.height(8),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
               headline ?? 'OTP Verification' ,
                style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: ApxColors.buttonColor),
              ),
            ),
            const ApxSpacing.mediumHeight(),
            Divider(
              height: 1.0,
              color: ApxColors.greyColor[300],
            ),
            ApxSpacing.height(22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  subHeadline ??  'An OTP has been sent to your email.\n                Please check your phone.',
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ApxSpacing.height(20.h),
                  PinCodeTextField(
                    controller: controller,
                    appContext: context,
                    backgroundColor: Colors.transparent,
                    length:length ?? 6,
                    obscureText: false,
                     validator: context.validateFieldNotEmpty,
                    animationType: AnimationType.fade,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),

                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                      borderRadius: BorderRadius.circular(5),
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 50.w,
                      fieldWidth: 50.w,
                      
                      activeBorderWidth: 1.0,
                      selectedBorderWidth: 1.0,
                      borderWidth: 1.0,
                      inactiveBorderWidth: 1.0,
                      selectedColor: ApxColors.greyColor,
                      activeFillColor: ApxColors.whiteColor,
                      inactiveColor: ApxColors.greyColor,
                      activeColor: ApxColors.greyColor,
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
                  
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
