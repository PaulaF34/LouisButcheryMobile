import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ForgotPasswordController.dart';

class ForgotPassword extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: controller.sendResetLink,
              child: Text('Send Reset Link'),
            )),
          ],
        ),
      ),
    );
  }
}
