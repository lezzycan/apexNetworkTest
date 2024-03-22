import 'package:apex/views/authentication/onboarding/onboarding_screen_controller.dart';
import 'package:get/get.dart';

class OnBoardingScreenBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<OnBoardingScreenController>(() => OnBoardingScreenController(
    ));
  }
}