

import 'package:apex/app.dart';
import 'package:apex/core/bindings/binndings_manager.dart';
import 'package:apex/service/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  configLoading();
   await LocalStorage.init();
  BindingManager.setupBindings();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  ).then(
    (_) => runApp(ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => const ApxApp(),
    )),
  );
}
