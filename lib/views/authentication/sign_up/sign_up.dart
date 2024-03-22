import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/common/smart_widgets/apx_textfield.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:apex/views/authentication/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
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
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              width: 1.0,
                              color: ApxColors.containerBorderColor)),
                      child: const Icon(Icons.keyboard_arrow_left),
                    ).apxTouchable(() {
                      Get.back();
                    }),
                    const ApxSpacing.mediumHeight(),
                    Text.rich(TextSpan(
                        text: 'Create a',
                        style: textTheme.titleSmall?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: ApxColors.buttonColor),
                        children: [
                          TextSpan(
                              text: ' SmartPay',
                              style: textTheme.titleLarge?.copyWith(
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.sp,
                                  color: ApxColors.primaryColor),
                              children: [
                                TextSpan(
                                  text: ' \naccount',
                                  style: textTheme.titleSmall?.copyWith(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ApxColors.buttonColor),
                                )
                              ])
                        ])),
                    const ApxSpacing.bigHeight(),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ApxTextFormFieldWidget(
                            hintText: 'Email',
                            controller:
                                SignUpController.instance.emailController,
                            validator: context.validateEmailAddress,
                          ),
                          const ApxSpacing.mediumHeight(),
                          const ApxSpacing.bigHeight(),
                          CustomButton(
                            backGroundColor: SignUpController
                                    .instance.emailController.text.isEmpty
                                ? ApxColors.greyColor
                                : ApxColors.buttonColor,
                            width: double.infinity,
                            onPressed: SignUpController
                                    .instance.emailController.text.isEmpty
                                ? null
                                : () {
                                    if (formKey.currentState!.validate()) {
                                      SignUpController.instance
                                          .fetchEmailToken(context);
                                    }
                                  },
                            child: Text('Sign Up',
                                style: textTheme.headlineMedium?.copyWith(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w700,
                                    color: ApxColors.whiteColor,
                                    fontSize: 16.sp)),
                          ),
                        ],
                      ),
                    ),
                    const ApxSpacing.bigHeight(),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: Color(0XFFE5E7EB),
                        )),
                        Text(
                          ' OR ',
                          style: textTheme.headlineMedium?.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              color: ApxColors.greyColor,
                              fontSize: 14.sp),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Color(0XFFE5E7EB),
                          ),
                        ),
                      ],
                    ),
                    const ApxSpacing.bigHeight(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            backGroundColor: ApxColors.backgroundColor,
                            border: Border.all(
                                width: 1.0,
                                color: ApxColors.containerBorderColor),
                            onPressed: () {},
                            child: SvgPicture.asset(ApxAssets.google),
                          ),
                        ),
                        const ApxSpacing.mediumWidth(),
                        Expanded(
                          child: CustomButton(
                            backGroundColor: ApxColors.backgroundColor,
                            border: Border.all(
                                width: 1.0,
                                color: ApxColors.containerBorderColor),
                            onPressed: () {},
                            child: SvgPicture.asset(ApxAssets.apple),
                          ),
                        ),
                      ],
                    ),
                    ApxSpacing.height(MediaQuery.of(context).size.height / 9),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: textTheme.headlineMedium?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            color: ApxColors.greyColor,
                            fontSize: 14.sp,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: textTheme.headlineMedium?.copyWith(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                color: ApxColors.focusBorderColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ).apxTouchable(() {}),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
