import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/LoginController.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
  }

}