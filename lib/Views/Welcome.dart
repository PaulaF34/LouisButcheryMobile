import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Controllers/WelcomeController.dart';

class Welcome extends StatelessWidget {
  final WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Louis Butchery'),
        backgroundColor: Colors.redAccent.shade100,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/Louis Iskandar Without BG Final Logo.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Our App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: controller.goToLogin,
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.goToRegister,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
