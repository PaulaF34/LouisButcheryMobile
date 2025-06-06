import 'package:get/get.dart';
import '../Controllers/ForgotPasswordController.dart';


class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
