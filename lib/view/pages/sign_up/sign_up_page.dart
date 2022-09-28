import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_bloc/sign_up_cubit.dart';
import 'package:fashion_app/view/pages/sign_up/widget/background_signup_widget.dart';
import 'package:fashion_app/view/pages/sign_up/widget/front_widget_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SignUpCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const BackgroundSignupWidget(),
              FrontWidgetSignup()
            ],
          ),
        ),
      ),
    );
  }
}
