import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:louisbutcheryapp/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:louisbutcheryapp/Core/Network/DioClient.dart';
import 'package:louisbutcheryapp/Core/Network/ShowSuccessDialog.dart';

class LoginController extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadPrefs();
  }

  void _loadPrefs() async{
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null){
      Get.offAllNamed('/home');
    }
  }

  void login () async{
    print("Login Logic goes here");
    print('Email: ${email.text}');
    print('Password: ${password.text}');

    User user = User(
      email: email.text,
      password: password.text,
    );

    String requestBody = user.toJson();

    var post = await DioClient().getInstance().post('/login', data: requestBody);

    if (post.statusCode == 200){
      if (post.data['success']){
        ShowSuccessDialog(Get.context!, "Success", "Login Successful", (){
          // print("User Logged in successfully");
          // print("Token: ${post.data['token']}");
          prefs.setString('token', post.data['token']);
          Get.offAllNamed('/home');
        });
      }else{
        ShowSuccessDialog(Get.context!, "Error", "Login Failed", (){});
      }}else{
      ShowSuccessDialog(Get.context!, "Error", "Login Failed", (){});
    }

  }


}
