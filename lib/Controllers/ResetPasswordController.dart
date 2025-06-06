import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Routes/AppRoute.dart'; // Make sure this is imported

class ResetPasswordController extends GetxController {
  final emailController = TextEditingController();
  final tokenController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool hidePassword = true.obs;
  RxBool hideConfirmPassword = true.obs;

  Future<void> resetPassword() async {
    final url = Uri.parse('http://192.168.1.24:8000/api/reset-password');

    final response = await http.post(url, body: {
      'email': emailController.text.trim(),
      'token': tokenController.text.trim(),
      'password': passwordController.text,
      'password_confirmation': confirmPasswordController.text,
    });

    final body = json.decode(response.body);

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Password reset successful');
      await Future.delayed(Duration(seconds: 1)); // Wait a bit before navigating
      Get.offAllNamed(AppRoute.login); // Navigate to login screen
    } else {
      Get.snackbar('Error', body['message'] ?? 'Reset failed');
    }
  }
}
