import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordRecoveryController extends GetxController {
  static PasswordRecoveryController get instance => Get.find();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  navigateToRecoveryIdentityScreen(){
    Get.toNamed('/passwordRecoveryScreen/verifyIdentity', arguments: emailController.text);
  }
  navigateToCreateNewPassword(){
    Get.toNamed('/passwordRecoveryScreen/createNewPassword');
  }

  bool showEye = false;

void updateEye() {
    showEye = !showEye;
    update();
  }
  @override
  void onClose() {
    emailController.dispose();
     passwordController.dispose();
     otpController.dispose();
    super.onClose();
  }
}