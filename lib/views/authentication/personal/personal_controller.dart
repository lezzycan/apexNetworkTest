import 'package:apex/core/network/network_info.dart';
import 'package:apex/core/network/retrofit_client.dart';
import 'package:apex/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalScreenController extends GetxController {
  static PersonalScreenController get instance => Get.find();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  FocusNode get phoneFocusNode => FocusNode();
  final _formKey = GlobalKey<FormState>();

  final client = RetrofitClientInstance.getInstance().getDataService();

  String? image;

  String _countryCode = '';

  String get countryCode  =>  _countryCode;

  set countryCode(String val) {
    _countryCode  = val;
  }
  get formKey => _formKey;

  bool showEye = false;

  void updateEye() {
    showEye = !showEye;
    update();
  }

  navigateToSetPinCodePage() {
    Get.toNamed('/personal/setUpPin');
  }

  navigateToConfirmation() {
    Get.toNamed('/personal/confirmation', arguments: fullNameController.text);
  }

  navigateToLogin() {
    Get.toNamed('/loginScreen');
  }

  // method to register

  createAccount(BuildContext context) async {
    await startLoading(context);
    client
        ?.createAccount(fullNameController.text, userNameController.text, Get.arguments,
            countryCode, passwordController.text, 'mobile')
        .then((value) {
          loadingSuccessful(null);
           navigateToSetPinCodePage();
        })
        .catchError((err) {
      loadingFailed(err, context);
      update();
    });
  }

/// this is the method to set user pin to local storage
  setMyPin()async{
   await LocalStorage.setPin(otpController.text);
   navigateToConfirmation();
   print(otpController.text);
   update();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    countryController.dispose();
    otpController.dispose();
    phoneFocusNode.dispose();
    super.onClose();
  }
}
