import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/LoginController.dart';
import 'package:louisbutcheryapp/Routes/AppRoute.dart';

class Login extends GetView<LoginController> {
  final LoginController _controller = Get.put(LoginController());
  final RxBool _obscurePassword = true.obs; // Add observable to manage password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offNamed(AppRoute.welcome);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller.email,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
            Obx(() => TextField(
              controller: _controller.password,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
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
              onPressed: () {
                _controller.login();
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.black.withOpacity(0.2),
                elevation: 5,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoute.register);
              },
              child: Text(
                "Don't have an account? Register here",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
