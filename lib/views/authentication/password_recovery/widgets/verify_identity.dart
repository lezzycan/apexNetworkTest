import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/common/smart_widgets/otp_bottomsheet.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VerifyIdentityScreen extends StatelessWidget {
  VerifyIdentityScreen({super.key});
  final passCtrl = Get.put(PasswordRecoveryController());
  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments  ??  '';
    RegExp regex = RegExp(r".(?=@)"); // Matches any character except '@'

    String newEmail = email.replaceAllMapped(regex, (match) => "*");

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(ApxAssets.person),
                  const ApxSpacing.bigHeight(),
                  Text(
                    'Verify your Identity',
                    style: textTheme.headlineMedium?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        color: ApxColors.buttonColor),
                  ),
                  const ApxSpacing.mediumHeight(),
                  Text.rich(TextSpan(
                      text: 'Where would you like',
                      style: textTheme.titleSmall?.copyWith(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          color: ApxColors.greyColor),
                      children: [
                        TextSpan(
                            text: ' SmartPay',
                            style: textTheme.titleLarge?.copyWith(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                color: ApxColors.primaryColor),
                            children: [
                              TextSpan(
                                text: ' to send your security code?',
                                style: textTheme.titleSmall?.copyWith(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    color: ApxColors.greyColor),
                              )
                            ])
                      ])),
                  const ApxSpacing.largeHeight(),
                  Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ApxColors.backgroundColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 10.r,
                        backgroundColor: ApxColors.primaryColor,
                        child: Icon(
                          Icons.check,
                          color: ApxColors.whiteColor,
                          size: 15.sp,
                        ),
                      ),
                      title: Text(
                        'Email',
                        style: textTheme.titleLarge?.copyWith(
                            fontFamily: 'SF Pro Display',
                            color: ApxColors.buttonColor),
                      ),
                      subtitle: Text(
                        newEmail,
                        style: textTheme.labelLarge?.copyWith(
                            fontFamily: 'SF Pro Display',
                            color: ApxColors.greyColor,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(
                        Icons.email,
                        color: ApxColors.iconColor,
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                onPressed: () {
                  Get.bottomSheet(
                    OtpBottomSheet(
                        controller:
                            PasswordRecoveryController.instance.otpController,
                        onComplete: (val) {
                          PasswordRecoveryController.instance.navigateToCreateNewPassword();
                        }),
                        isDismissible: true,
                        isScrollControlled: true,
                        useRootNavigator: true
                  );
                },
                child: Text(
                  'Continue',
                  style: textTheme.titleMedium?.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      color: ApxColors.whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
