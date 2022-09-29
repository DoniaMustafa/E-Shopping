import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/home/home_page.dart';
import 'package:fashion_app/view/pages/my_profile/my_profile_page.dart';
import 'package:fashion_app/view/pages/my_profile/widget/list_product_widget.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_page.dart';
import 'package:fashion_app/view/pages/single_product/single_product_page.dart';
import 'package:flutter/material.dart';

class CustomGenerateRouter {
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String singleProd = '/singleProd';
  static const String myProfile = '/myProfile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? org=settings.arguments;

    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case singleProd :
        if(org is Data){
        return MaterialPageRoute(
            builder: (_) => SingleProductPage(
                  data: org,
                ));}else{
          return _generateErrorRoute();
        }

      case myProfile:
        return MaterialPageRoute(builder: (_) => const MyProfilePage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
  static Route<dynamic> _generateErrorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
        body: Center(
          child: Text('error'),
        ),
      );
    });
  }
}
