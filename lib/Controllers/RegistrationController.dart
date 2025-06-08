import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Core/Network/DioClient.dart';
import 'package:louisbutcheryapp/Core/Network/ShowSuccessDialog.dart';
import 'package:louisbutcheryapp/Routes/AppRoute.dart';
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
      final dio = DioClient().dio; // ✅ Correct usage of DioClient singleton

      var response = await dio.post(
        '/auth/register', // ✅ Correct endpoint path
        data: user.toJson(),
      );

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          (response.data['success'] == true || response.data['token'] != null)) {
        ShowSuccessDialog(
          Get.context!,
          "Success",
          "Registration Successful",
              () => Get.offAllNamed(AppRoute.login),
        );
      } else {
        ShowSuccessDialog(
          Get.context!,
          "Error",
          response.data['message'] ?? "Registration Failed",
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
