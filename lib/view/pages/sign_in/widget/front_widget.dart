import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/data/datasourse/local/cache_helper.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in_bloc/sign_in_cubit.dart';
import 'package:fashion_app/view/pages/sign_in/widget/email_and_password_widget.dart';
import 'package:fashion_app/view/widgets/custom_button_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FrontSignInWidget extends StatelessWidget {
  const FrontSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.55,
          maxWidth: double.infinity),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(80), bottomRight: Radius.circular(80))),
      child: _buildFrontWidgets(),
    );
  }

  _buildFrontWidgets() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
              txt: 'Welcome to e.Fashion',
              style: textThemeData.headline4!
                  .copyWith(color: const Color(0xFF1F2367))),
          const SizedBox(
            height: 15.0,
          ),
          CustomTextWidget(
            txt: 'please enter your information below to start\n using app',
            style: textThemeData.subtitle2!,
          ),
          const SizedBox(
            height: 40.0,
          ),
          const EmailAndPasswordWidget(),
          const SizedBox(
            height: 90.0,
          ),
          _buildSignInButton()
        ],
      );

  _buildSignInButton()=> BlocConsumer<SignInCubit, SignInState>(
    listener: (context, state) {
      if (state is SuccessState && state.userData != null) {
        di<CacheHelper>()
            .put('userModel', state.userData)
            .then((value) {
          di<CacheHelper>()
              .put('userToken', state.userData!.token)
              .then((values) async {
                print(state.userData!.token);
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }).catchError((error) {});
        });
      }
    },
    builder: (context, state) {
      return CustomButtonWidget(
        txt: 'Login',
        onPress: () {
          print('ok');
          if (context
              .read<SignInCubit>()
              .formKey
              .currentState!
              .validate()) {
             context.read<SignInCubit>().login(context);
          }
        },
      );
    },
  );
}
