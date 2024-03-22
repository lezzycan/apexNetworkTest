import 'package:apex/views/authentication/password_recovery/password_recovery_controller.dart';
import 'package:get/get.dart';

class PasswordRecoveryBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PasswordRecoveryController>(() => PasswordRecoveryController());
  
  }
}