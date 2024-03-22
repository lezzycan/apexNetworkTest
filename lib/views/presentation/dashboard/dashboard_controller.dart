


import 'package:apex/core/network/network_info.dart';
import 'package:apex/core/network/retrofit_client.dart';
import 'package:apex/model/dashboard/dashboard_res.dart';
import 'package:apex/model/login/login_res.dart';
import 'package:apex/utils/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  static DashBoardController get instance => Get.find();

  DashBoardRes? dashBoardRes;
 bool reveal = false;
LoginRes? loginRes;
  bool isLoading = false;

  fetchSecret() async {
    isLoading = true;
    update();
    RetrofitClientInstance.getInstance()
        .getDataService()
        ?.getSecret()
        .then((value) {
      loadingSuccessful(null);
      dashBoardRes = value;
      isLoading = false;
      update();
    }).catchError((err) {
      loadingFailed(err, Get.context);
      isLoading = false;
      update();
    });
    update();
  }

  logout(BuildContext context) async {
    await startLoading(context);
    RetrofitClientInstance.getInstance()
        .getDataService()
        ?.logout()
        .then((value) {
          print('logout');
          Navigator.pop(context);
          Get.toNamed(RouterHelper.loginScreen);
          loadingSuccessful(null);
           RetrofitClientInstance.getInstance().setToken(loginRes?.data?.token);
        })
        .catchError((err) {
      loadingFailed(err, context);
    });
    update();
  }

  @override
  void onInit() {
    fetchSecret();
  
    update();
    super.onInit();
  }
}
