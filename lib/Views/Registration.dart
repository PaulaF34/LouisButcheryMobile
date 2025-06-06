import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/RegistrationController.dart';

import '../Routes/AppRoute.dart';

class Registration extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());
  final RxBool _obscurePassword = true.obs; // For password visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.name,
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "Enter your full name",
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: controller.address,
              decoration: InputDecoration(
                labelText: "Address",
                hintText: "Enter your address",
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: controller.phone,
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "Enter your phone number",
              ),
            ),
            SizedBox(height: 12),
            Obx(() => TextField(
              controller: controller.password,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter a secure password",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword.value ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    _obscurePassword.value = !_obscurePassword.value;
                  },
                ),
              ),
              obscureText: _obscurePassword.value,
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.register,
              child: Text("Register"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoute.login);
              },
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
