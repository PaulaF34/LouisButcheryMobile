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
      name: name.text.trim(),
      address: address.text.trim(),
      email: email.text.trim(),
      phone: phone.text.trim(),
      password: password.text,
      role: 'customer',
    );

    try {
      var post = await DioClient().getInstance().post(
        '/register',
        data: user.toJson(), // ✅ Send as Map, not String
      );

      if ((post.statusCode == 200 || post.statusCode == 201) && post.data['success'] == true) {
        ShowSuccessDialog(
          Get.context!,
          "Success",
          "Registration Successful",
              () => Get.offAllNamed('/login'),
        );
      } else {
        ShowSuccessDialog(
          Get.context!,
          "Error",
          post.data['message'] ?? "Registration Failed",
              () {},
        );
      }
    } catch (e) {
      ShowSuccessDialog(
        Get.context!,
        "Error",
        "Connection Failed: $e",
            () {},
      );
    }
  }
}
