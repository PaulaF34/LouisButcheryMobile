import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final isLoading = false.obs;

  Future<void> sendResetLink() async {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }

    isLoading.value = true;

    final url = Uri.parse('http://192.168.1.24:8000/api/forgot-password'); // Update IP as needed
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Reset link sent to your email');

      // ✅ Navigate to Reset Password page
      Get.toNamed('/reset-password');
    } else {
      final body = jsonDecode(response.body);
      Get.snackbar('Error', body['message'] ?? 'Something went wrong');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
