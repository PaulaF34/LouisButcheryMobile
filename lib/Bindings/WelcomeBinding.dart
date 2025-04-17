import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/WelcomeController.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
