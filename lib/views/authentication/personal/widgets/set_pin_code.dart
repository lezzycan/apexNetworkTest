import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/dumb_widget/pincode.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetPinCode extends StatelessWidget {
  const SetPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40.w,
                  width: 40.w,
                  decoration: BoxDecoration(
                      // color: ApxColors.greyColor[100],
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          width: 1.0, color: ApxColors.containerBorderColor)),
                  child: const Icon(Icons.keyboard_arrow_left),
                ).apxTouchable(() {
                  Get.back();
                }),
                const ApxSpacing.mediumHeight(),
                Text(
                  'Set your PIN code',
                  style: textTheme.headlineMedium?.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: ApxColors.buttonColor),
                ),
                const ApxSpacing.mediumHeight(),
                Text(
                  'We use state-of-the-art security measures to protect your information at all times',
                  style: textTheme.titleLarge?.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: const Color(0XFF6B7280),),
                ),
                const ApxSpacing.bigHeight(),
                PincodeWidget(
                  controller: PersonalScreenController.instance.otpController,
                 shape: PinCodeFieldShape.underline,
                 obscureText:true,
                  focusNode: PersonalScreenController.instance.phoneFocusNode,
                ),
                const ApxSpacing.bigHeight(),
                
                const ApxSpacing.xxLargeHeight(),
                CustomButton(
                  width: double.infinity,
                  onPressed: () {
                    PersonalScreenController.instance.setMyPin();
                  },
                  child: Text('Create Pin',
                      style: textTheme.headlineMedium?.copyWith(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                          color: ApxColors.whiteColor,
                          fontSize: 16.sp)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
