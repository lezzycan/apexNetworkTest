import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ApxAssets.thumbs),
              Text(
                'Congratulations, ${Get.arguments}',
                style: textTheme.headlineMedium?.copyWith(
                    color: ApxColors.buttonColor,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700),
              ),
              const ApxSpacing.bigHeight(),
              Text(
                'You’ve completed the onboarding, you can start using smartpay',
                textAlign: TextAlign.center,
                style: textTheme.titleSmall?.copyWith(
                    color: ApxColors.greyColor,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400),
              ),
              const ApxSpacing.xxLargeHeight(),
              CustomButton(
                width: double.infinity,
                onPressed: () {
                  PersonalScreenController.instance.navigateToLogin();
                },
                child: Text('Get Started',
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
    );
  }
}
