import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/LoginController.dart';
import 'package:louisbutcheryapp/Routes/AppRoute.dart';

class Login extends GetView<LoginController> {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offNamed(AppRoute.welcome); // Explicitly go to Welcome page
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
            TextField(
              controller: _controller.password,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
              ),
              obscureText: true,
            ),
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
