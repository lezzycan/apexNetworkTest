

import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/common/smart_widgets/apx_textfield.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:apex/views/authentication/password_recovery/password_recovery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                ).apxTouchable(() {Get.back(closeOverlays: true);}),
                const ApxSpacing.mediumHeight(),
                Text(
                  'Create New Password',
                  style: textTheme.headlineMedium?.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600),
                ),
                ApxSpacing.height(6.h),
                Text(
                  'Please, enter a new password below different from the previous password',
                  style: textTheme.titleLarge?.copyWith(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF6B7280)),
                ),
                const ApxSpacing.bigHeight(),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      const ApxSpacing.mediumHeight(),
                      GetBuilder<PasswordRecoveryController>(
                        builder: (loginCtrl) => ApxTextFormFieldWidget(
                          hintText: 'Password',
                          obscureText: loginCtrl.showEye,
                          validator: context.validateFieldNotEmpty,
                          maxLines: 1,
                          controller: loginCtrl.passwordController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginCtrl.updateEye();
                            },
                            icon: Icon(loginCtrl.showEye
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: ApxColors.greyColor[400],
                          ),
                        ),
                      ),
                     const ApxSpacing.mediumHeight(),
                      GetBuilder<PasswordRecoveryController>(
                        builder: (loginCtrl) => ApxTextFormFieldWidget(
                          hintText: 'Confirm Password',
                          obscureText: loginCtrl.showEye,
                          validator: (value){
                          return context.validateConfirmPassword(value: PasswordRecoveryController.instance.confirmPassword.text, initialPassword: PasswordRecoveryController.instance.passwordController.text);
                          },
                          maxLines: 1,
                          controller: loginCtrl.passwordController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginCtrl.updateEye();
                            },
                            icon: Icon(loginCtrl.showEye
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: ApxColors.greyColor[400],
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
               
               
              ],
            ),
            CustomButton(
                        width: double.infinity,
                        onPressed: () {},
                        child: Text('Create new password',
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