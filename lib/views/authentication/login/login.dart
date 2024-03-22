import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/core/network/network_info.dart';
import 'package:apex/service/local_storage.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/dumb_widget/pincode.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/common/smart_widgets/apx_textfield.dart';
import 'package:apex/utils/common/smart_widgets/otp_bottomsheet.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:apex/utils/validator/validator.dart';
import 'package:apex/views/authentication/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

 
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
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 40.w,
                  //   width: 40.w,
                  //   decoration: BoxDecoration(
                  //       // color: ApxColors.greyColor[100],
                  //       borderRadius: BorderRadius.circular(12.r),
                  //       border: Border.all(
                  //           width: 1.0, color: ApxColors.containerBorderColor)),
                  //   child: const Icon(Icons.keyboard_arrow_left),
                  // ).apxTouchable(() {
                  //   Get.back();
                  // }),
                  const ApxSpacing.mediumHeight(),
                  Text(
                    'Hi There 👋',
                    style: textTheme.headlineMedium?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  ApxSpacing.height(6.h),
                  Text(
                    'Welcome back, Sign in to your account',
                    style: textTheme.titleLarge?.copyWith(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF6B7280)),
                  ),
                  const ApxSpacing.bigHeight(),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ApxTextFormFieldWidget(
                          hintText: 'Email',
                          controller: LoginController.instance.emailController,
                          validator: context.validateEmailAddress,
                        ),
                        const ApxSpacing.mediumHeight(),
                        GetBuilder<LoginController>(
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
                        Text(
                          'Forgot Password?',
                          style: textTheme.titleLarge?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0XFF0A6375),
                          ),
                        ).apxTouchable(() {LoginController.instance.navigateToPasswordRecoveryScreen();}),
                        const ApxSpacing.bigHeight(),
                        CustomButton(
                          width: double.infinity,
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              LoginController.instance.signIn(context);
                              LocalStorage.setEmail(LoginController.instance.emailController.text);
                              LocalStorage.setPassword(LoginController.instance.passwordController.text);
                            }
                          },
                          child: Text('Sign in',
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
              LocalStorage.getLogIn() == true ?     TextButton(
                    onPressed: (){
                      Get.bottomSheet( 
                        OtpBottomSheet(
                          length: 5,
                          headline: 'Log in with  your registered pin',
                         subHeadline: '',
                        controller:  LoginController.instance.otpController,
                           
                         onComplete: (p0) {
                    if(LocalStorage.getPin() != LoginController.instance.otpController.text ){
                      handleErrorType(context, 'Pin is not correct', 'warning');
                    } else {
                      LoginController.instance.signInWithPIN(context, LocalStorage.getEmail(), LocalStorage.getPassword());
                    }
                  },
                        ),
                        isDismissible: true,
                        isScrollControlled: true,
                        useRootNavigator: true
                        
                //         PincodeWidget(
                //   controller: LoginController.instance.otpController,
                //  shape: PinCodeFieldShape.underline,
                //  obscureText:true,
                //   focusNode: LoginController.instance.phoneFocusNode,
                //   onComplete: (p0) {
                //     if(LocalStorage.getPin() != LoginController.instance.otpController.text ){
                //       handleErrorType(context, 'Pin is not correct', 'warning');
                //     } else {
                //       LoginController.instance.signInWithPIN(context, LocalStorage.getEmail(), LocalStorage.getPassword());
                //     }
                //   },
                // ),
                );
                    },
                    child: Text('Log in with pin',
                  style: textTheme.headlineMedium?.copyWith(
                       fontFamily: 'SF Pro Display',
                       fontWeight: FontWeight.w400,
                       color: ApxColors.primaryColor,
                       fontSize: 14.sp),)
                                        ) :const  SizedBox.shrink(),
                                      
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
                    child: Text.rich(TextSpan(
                        text: 'Don’t have an account? ',
                          style: textTheme.headlineMedium?.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              color: ApxColors.greyColor,
                              fontSize: 14.sp,),
                        children: [TextSpan(text: 'Sign Up',
                          style: textTheme.headlineMedium?.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w600,
                              color: ApxColors.focusBorderColor,
                              fontSize: 14.sp,),
                        ),],),).apxTouchable(() {
                          LoginController.instance.navigateToCreateAccount();
                        }),
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
