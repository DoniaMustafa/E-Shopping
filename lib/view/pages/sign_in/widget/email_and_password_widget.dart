import 'package:fashion_app/view/pages/sign_in/sign_in_bloc/sign_in_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPasswordWidget extends StatelessWidget {
  const EmailAndPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
          key: context.read<SignInCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormWidget(
            icon: Icons.email,
            val: 'Please enter your email',
            txtField: 'Email',
            isPass: false,
            controller: context.read<SignInCubit>().emailController,
          ),
          const SizedBox(
            height: 20.0,
          ),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return CustomTextFormWidget(
                icon: Icons.lock,
                onTap: () => context.read<SignInCubit>().showPass(),
                val: 'Please enter your password',
                isShow: context.read<SignInCubit>().isShow,
                txtField: 'Password',
                isPass: true,
                controller: context.read<SignInCubit>().passController,
              );
            },
          ),
        ],
      ),
    );
  }
}
