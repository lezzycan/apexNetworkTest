import 'package:apex/core/network/network_info.dart';
import 'package:apex/core/network/retrofit_client.dart';

import 'package:apex/model/login/login_res.dart';
import 'package:apex/service/local_storage.dart';
import 'package:apex/utils/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  FocusNode get phoneFocusNode => FocusNode();
  FocusNode get passwordFocusNode => FocusNode();

 
  LoginRes? loginRes;

  bool showEye = false;

  void updateEye() {
    showEye = !showEye;
    update();
  }

  navigateToPasswordRecoveryScreen() {
    Get.toNamed(RouterHelper.passwordRecoveryScreen);
  }

  navigateToCreateAccount() {
    Get.toNamed(RouterHelper.signUp);
  }

  navigateToDasboard() {
    Get.toNamed('/dashboard');
  }

  signIn(BuildContext context) async {
    await startLoading(context);
    RetrofitClientInstance.getInstance()
        .getDataService()
        ?.login(emailController.text, passwordController.text, 'mobile')
        .then((value) async {
      loginRes = value;
      loadingSuccessful(null);
      RetrofitClientInstance.getInstance().setToken(loginRes?.data?.token);
      LocalStorage.setLogIn(true);
      LocalStorage.setEmail(emailController.text);
      LocalStorage.setPassword(passwordController.text);
      navigateToDasboard();
    }).catchError((err) {
      loadingFailed(err, context);
    });
  }

  signInWithPIN(BuildContext context, String email, String password) async {
    await startLoading(context);
    RetrofitClientInstance.getInstance()
        .getDataService()
        ?.login(email, password, 'mobile')
        .then((value) {
          loadingSuccessful(null);
           RetrofitClientInstance.getInstance().setToken(loginRes?.data?.token);
            navigateToDasboard();
        })
        .catchError((err) {
      loadingFailed(err, context);
    });
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
