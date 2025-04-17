import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void goToLogin() {
    Get.toNamed('/login');
  }

  void goToRegister() {
    Get.toNamed('/register');
  }
}
