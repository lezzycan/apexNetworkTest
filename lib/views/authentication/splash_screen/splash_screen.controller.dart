import 'package:apex/utils/routes/app_router.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {


  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed( const Duration(milliseconds: 2000));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
  
   navigateToOnboardingScreen();
  }

  void navigateToOnboardingScreen () {
    Get.toNamed(RouterHelper.onboardingScreen);
  }

  @override
  void onInit() {
   runStartupLogic();
    super.onInit();
  }
}