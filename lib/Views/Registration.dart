import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/RegistrationController.dart';

import '../Routes/AppRoute.dart';

class Registration extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      resizeToAvoidBottomInset: true, // Helps avoid overflow
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
            TextField(
              controller: controller.password,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter a secure password",
              ),
              obscureText: true,
            ),
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
