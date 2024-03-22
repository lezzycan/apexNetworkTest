import 'dart:io';

import 'package:apex/core/network/bad_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

Future<void> startLoading(BuildContext context,
    [String message = "Please wait...", bool? isdismissed]) async {
  FocusScope.of(context).requestFocus(FocusNode());
  EasyLoading.show(
      dismissOnTap: false,
      status: message,
      maskType: EasyLoadingMaskType.black);
}

loadingSuccessful(String? message,
    [bool showDialog = false,
    BuildContext? context,
    bool gotoDashBoard = true,
    Function? listener]) {
  EasyLoading.dismiss().then((value) {
    if (message != null) {
      toastSuccess(message);
    }
  });
}

void toastSuccess(String message) {
  Fluttertoast.showToast(
      msg: message == null ? '' : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}

void toastError(String message) {
  Fluttertoast.showToast(
      msg: message ?? '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

Future<void> loadingFailed(Object? message,
    [BuildContext? context, bool showAsDialog = false]) async {
  EasyLoading.dismiss();
  if (message is DioError) {
    if ((message.error != null && message.error is SocketException) ||
        (message.type == DioErrorType.connectionTimeout)) {
      Navigator.push(
          context!, MaterialPageRoute(builder: (context) => const BadNetwork()));
    }
  }
  if (message != null) {
    //  if (message is String) toastError(message);
    if (message is DioError) {
      //debugger();
      if (message.response!.statusCode == 413) {
       handleErrorType(context!, "File too large", "warning");
      }
      if (message.response!.statusCode! >= 300 &&
          message.response!.statusCode! < 400) {
        handleErrorType(context!, "An Error Occured ", 'warning');
      }

      if (message.response!.statusCode! >= 400 &&
          message.response!.statusCode! < 500) {
        // if (message.response!.data['message'].contains("Session expired")) {
        //
        //   showSnackBar(context!,message.response!.data['message'] ??"Something certainly is not right, but "
        //       "we are working on it);"
        // }

        if (context != null) {
          handleErrorType(
              context,
              message.response?.data['message'] ??
                  message.response!.data['errors'].toString() ??
                  "An Error Occured", 'warning');
        } else {
          if (kDebugMode) {
            handleErrorType(
              Get.context!,
              message.response?.data['message'] ??
                message.response!.data['errors'].toString() ??
                "An Error Occured", 'warning');
            print(message.stackTrace);
          }
        }
      }

      if (message.response!.statusCode! >= 500) {
        handleErrorType(context!, "An Error Occured ", 'warning');
      }
    }
  }
}

void showSnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    elevation: 0,
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: const Color(0xffFFF5F5),
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: const Color(0xffEC575E))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svgs/error.svg",
              height: 24.w,
              width: 24.w,
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
                child: Text(
              msg,
              style: const TextStyle(color: Color(0xff66191D)),
            )),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    padding: EdgeInsets.zero,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackBar(BuildContext context, String msg) {
  final snackBar = SnackBar(
    elevation: 0,
    content: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        decoration: BoxDecoration(
            color: const Color(0xff46CF68),
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: const Color(0xffE6CCFF))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
                child: Text(
              msg,
              style: const TextStyle(color: Colors.white),
            )),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color(0xff46CF68),
    padding: EdgeInsets.zero,
  );
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

handleErrorType(BuildContext context, String message, String type) {
  GetSnackBar snkBar = GetSnackBar(
    messageText: Text(
      message,
      style: TextStyle(
          color: type == "warning"
              ? const Color(0xFFBA8211)
              : type == "info"
                  ? const Color(0xFF40711B)
                  : const Color(0xff66191D)),
    ),
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 7),
    icon: type == "warning"
        ? Icon(
            Icons.error,
            size: 20.w,
            color: const Color(0xffBB8211),
          )
        : type == "info"
            ? Icon(
                Icons.check_circle,
                size: 20.w,
                color: const Color(0xff41711C),
              )
            : Icon(
                Icons.cancel_rounded,
                size: 20.w,
                color: const Color(0xff66191D),
              ),
    backgroundColor: type == "warning"
        ? const Color(0xFFFFF9EF)
        : type == "info"
            ? const Color(0xFFF7FEF1)
            : const Color(0xffFFF5F5),
    overlayColor: Colors.transparent,
    barBlur: 7.0,
    borderRadius: 10.r,
    borderColor: type == "warning"
        ? const Color(0xFFFEBE3D)
        : type == "info"
            ? const Color(0xFF90D75B)
            : const Color(0xffEC575E),
    margin: EdgeInsets.symmetric(horizontal: 10.w),
  );
  snkBar.show();
}

