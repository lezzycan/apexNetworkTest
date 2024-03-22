import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/dumb_widget/pincode.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

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
                  'Verify your Identity',
                  style: textTheme.headlineMedium?.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w600,
                      color: ApxColors.buttonColor),
                ),
                const ApxSpacing.mediumHeight(),
                Text.rich(
                  TextSpan(
                    text: 'We send a code to(',
                    style: textTheme.titleSmall?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        color: ApxColors.greyColor),
                    children: [
                      TextSpan(
                        text: '${Get.arguments}',
                        style: textTheme.titleLarge?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600,
                            color: ApxColors.buttonColor),
                        children: [
                          TextSpan(
                            text: '). Enter it here to verify your identity',
                            style: textTheme.titleSmall?.copyWith(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                                color: ApxColors.greyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const ApxSpacing.bigHeight(),
                PincodeWidget(
                  controller: SignUpController.instance.otpController,
                  onComplete: (val) {},
                  focusNode: SignUpController.instance.phoneFocusNode,
                ),
                const ApxSpacing.bigHeight(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Resend code 30 secs',
                    style: textTheme.titleLarge?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFF727272)),
                  ),
                ),
                const ApxSpacing.xxLargeHeight(),

               CustomButton(
                          width: double.infinity,
                          backGroundColor: SignUpController
                                    .instance.otpController.text.isEmpty
                                ? ApxColors.greyColor
                                : ApxColors.buttonColor,
                          onPressed: () {
                         SignUpController.instance.verifyEmail(context);
                          },
                          child: Text('Confirm',
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
