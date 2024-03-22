import 'package:apex/core/network/network_info.dart';
import 'package:apex/core/network/retrofit_client.dart';
import 'package:apex/model/signup/http_response_model.dart';
import 'package:apex/model/signup/verify_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  FocusNode get phoneFocusNode => FocusNode();

  final _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  final client = RetrofitClientInstance.getInstance().getDataService();

  VerifyRes? verifyRes;
  HttpResponseModel? httpResponseModel;

  navigateToLoginScreen() {
    Get.toNamed('/loginScreen');
  }

  navigateToOtpVerification() {
    Get.toNamed(
      '/signUp/otpPage',
      arguments: emailController.text,
    );
  }

  navigateToPersonalScreen() {
    Get.toNamed('/personal', arguments: verifyRes?.data?.email) ;
    
  }

  // method to  get token
  fetchEmailToken(BuildContext context) async {
    await startLoading(context);
    client?.getEmailToken(emailController.text).then((value) {
      loadingSuccessful(null);
      httpResponseModel = value;
      navigateToOtpVerification();
    }).catchError((err) {
      loadingFailed(err, context);
    });
    update();
  }

  /// method to  verify email

///  the token to verify the email is not sent to the entered email from backened
/// Because of this, the token gotten from the response which is supposed to be received by the registered email will be loaded from here
/// Note: This method is not advisable or right. 
  verifyEmail(BuildContext context) async {
    await startLoading(context);
    client?.verifyEmailToken(emailController.text,
     '${httpResponseModel?.data?.token}'
     // otpController.text is the value that is suppose to be passed
     )
        .then((value) {
      loadingSuccessful(null);
      verifyRes = value;
      navigateToPersonalScreen();
    }).catchError((err) {
      loadingFailed(err, context);
    });
    update();
  }

  

  @override
  void onClose() {
    emailController.dispose();
    phoneFocusNode.dispose();
    otpController.dispose();
    super.onClose();
  }
}
