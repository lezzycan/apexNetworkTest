import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/common/smart_widgets/apx_textfield.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:apex/views/authentication/password_recovery/password_recovery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: (){
         FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:20.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(ApxAssets.lock),
                  const ApxSpacing.bigHeight(),
                  Text(
                    'Password Recovery',
                    style: textTheme.headlineMedium?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        color: ApxColors.buttonColor),
                  ),
                  const ApxSpacing.mediumHeight(),
                  Text(
                    'Enter your registered email below to receive password instructions',
                    style: textTheme.titleSmall?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        color: ApxColors.greyColor),
                  ),
                  const ApxSpacing.bigHeight(),
                  ApxTextFormFieldWidget(
                    hintText: 'Email',
                    validator: context.validateEmailAddress,
                    controller: PasswordRecoveryController.instance.emailController,
                  ),
                  const ApxSpacing.xxLargeHeight(),
                  CustomButton(
                    onPressed: () {
                      PasswordRecoveryController.instance.navigateToRecoveryIdentityScreen();
                    },
                    child: Text(
                      'Send me email',
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
        ),
      ),
    );
  }
}
