import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:louisbutcheryapp/Core/Network/DioClient.dart';
import 'package:louisbutcheryapp/Core/Network/ShowSuccessDialog.dart';
import 'package:louisbutcheryapp/Routes/AppRoute.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    _loadPrefs();
  }

  void _loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      Get.offAllNamed(AppRoute.home);
    }
  }

  void login() async {
    print("Attempting login...");
    print('Email: ${email.text}');
    print('Password: ${password.text}');

    try {
      final dio = DioClient().dio; // ✅ Correct usage of singleton

      var response = await dio.post(
        '/auth/login', // ✅ Full path under /api
        data: {
          'email': email.text.trim(),
          'password': password.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];
        final message = response.data['message'] ?? 'Login successful';

        if (token != null) {
          await prefs.setString('token', token);

          ShowSuccessDialog(
            Get.context!,
            "Success",
            message,
                () {
              Get.offAllNamed(AppRoute.home);
            },
          );
        } else {
          ShowSuccessDialog(
            Get.context!,
            "Error",
            "Token not found in response.",
                () {},
          );
        }
      } else {
        ShowSuccessDialog(Get.context!, "Error", "Wrong Credentials", () {});
      }
    } catch (e) {
      print('Login error: $e');
      ShowSuccessDialog(Get.context!, "Error", "Connection failed", () {});
    }
  }
}
