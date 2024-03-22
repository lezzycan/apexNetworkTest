import 'package:apex/views/authentication/personal/personal_controller.dart';
import 'package:get/get.dart';

class PersonalScreenBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PersonalScreenController>(() => PersonalScreenController(
    ));
  }
}