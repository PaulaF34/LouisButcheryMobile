import 'package:get/get.dart';
import 'package:louisbutcheryapp/Bindings/RegistrationBinding.dart';
import 'package:louisbutcheryapp/Routes/AppRoute.dart';
import 'package:louisbutcheryapp/Views/Registration.dart';
import 'package:louisbutcheryapp/Bindings/LoginBinding.dart';
import 'package:louisbutcheryapp/Views/Login.dart';
import 'package:louisbutcheryapp/Views/ResetPassword.dart';
import 'package:louisbutcheryapp/Views/Welcome.dart';
import 'package:louisbutcheryapp/Views/Home.dart';
import 'package:louisbutcheryapp/Bindings/HomeBinding.dart';
import '../Bindings/ForgotPasswordBinding.dart';
import '../Bindings/ProductBinding.dart';
import '../Bindings/ResetPasswordBinding.dart';
import '../Bindings/WelcomeBinding.dart';
import 'package:louisbutcheryapp/Views/ForgotPassword.dart';
import '../Views/Product.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(name: AppRoute.register, page: () => Registration(), binding: RegistrationBinding()),
    GetPage(name: AppRoute.login, page: () => Login(), binding: LoginBinding()),
    GetPage(name: AppRoute.welcome, page: () => Welcome(), binding: WelcomeBinding()),
    GetPage(name: AppRoute.home, page: () => Home(), binding: HomeBinding()),
    GetPage(name: AppRoute.forgotPassword, page: () => ForgotPassword(), binding: ForgotPasswordBinding()),
    GetPage(name: '/reset-password', page: () =>  ResetPassword(), binding: ResetPasswordBinding()),
    GetPage(name: '/products', page: () => HomePage(), binding: ProductBinding()),

  ];
}
