import 'package:fashion_app/view/pages/home/home_page.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class CustomGenerateRouter {

  static const String signIn= '/signIn';
  static const String signUp= '/signUp';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());


      default:
        return MaterialPageRoute(
            builder: (context) => const HomePage());


    }}
}