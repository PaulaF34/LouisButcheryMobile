import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Core/Network/DioClient.dart';
import 'package:louisbutcheryapp/Core/Network/ShowSuccessDialog.dart';
import '../Models/User.dart';

class RegistrationController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();

  void register() async {
    User user = User(
      name: name.text,
      address: address.text,
      email: email.text,
      phone: phone.text,
      password: password.text,
      role: 'customer', // Force default role
    );

    String requestBody = user.toJson();

    var post = await DioClient().getInstance().post('/register', data: requestBody);

    if (post.statusCode == 200) {
      ShowSuccessDialog(Get.context!, "Success", "Registration Successful", () {});
      Get.offAllNamed('/login');
    } else {
      ShowSuccessDialog(Get.context!, "Error", "Registration Failed", () {});
    }
  }
}
