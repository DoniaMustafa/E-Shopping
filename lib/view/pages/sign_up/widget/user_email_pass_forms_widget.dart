import 'package:fashion_app/view/pages/sign_up/sign_up_bloc/sign_up_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormsWidget extends StatelessWidget {
  const FormsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignUpCubit>().formKey2,
        child: Column(
          children: [
            CustomTextFormWidget(
              icon: Icons.person,
              val: 'Please enter your UserName',
              txtField: 'UserName',
              isPass: false,
              controller: context.read<SignUpCubit>().userController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextFormWidget( icon: Icons.email,
              val: 'Please enter your email',
              txtField: 'Email',
              isPass: false,
              controller: context.read<SignUpCubit>().emailController,
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextFormWidget( icon: Icons.lock,
              onTap: () => context.read<SignUpCubit>().isSelect(),
              val: 'Please enter your password',
              isShow: context.read<SignUpCubit>().isShow,
              txtField: 'Password',
              isPass: true,
              controller: context.read<SignUpCubit>().passController,
            )
          ],
        ));
  }
}
