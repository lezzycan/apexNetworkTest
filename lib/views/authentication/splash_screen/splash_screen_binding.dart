import 'package:apex/views/authentication/splash_screen/splash_screen.controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}