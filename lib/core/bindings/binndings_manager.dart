import 'package:apex/core/bindings/bindings.dart';
import 'package:get/get.dart';

class BindingManager {
  static void setupBindings() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
    Get.lazyPut<OnBoardingScreenController>(() => OnBoardingScreenController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<PasswordRecoveryController>(() => PasswordRecoveryController());
     Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<PersonalScreenController>(() => PersonalScreenController());
       Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
