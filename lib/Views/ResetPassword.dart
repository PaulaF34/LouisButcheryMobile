import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ResetPasswordController.dart';

class ResetPassword extends StatelessWidget {
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.tokenController,
              decoration: InputDecoration(labelText: "Reset Token"),
            ),
            Obx(() => TextField(
              controller: controller.passwordController,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: "New Password",
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => controller.hidePassword.toggle(),
                ),
              ),
            )),
            Obx(() => TextField(
              controller: controller.confirmPasswordController,
              obscureText: controller.hideConfirmPassword.value,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                suffixIcon: IconButton(
                  icon: Icon(controller.hideConfirmPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => controller.hideConfirmPassword.toggle(),
                ),
              ),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.resetPassword,
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
