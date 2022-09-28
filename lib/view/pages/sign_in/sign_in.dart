import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in_bloc/sign_in_cubit.dart';
import 'package:fashion_app/view/pages/sign_in/widget/background_widget.dart';
import 'package:fashion_app/view/pages/sign_in/widget/email_and_password_widget.dart';
import 'package:fashion_app/view/pages/sign_in/widget/front_widget.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SignInCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: const [BackgroundWidget(), FrontSignInWidget()],
          ),
        ),
      ),
    );
  }
}
