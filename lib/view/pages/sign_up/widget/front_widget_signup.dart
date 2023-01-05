import 'package:fashion_app/view/pages/sign_up/sign_up_bloc/sign_up_cubit.dart';
import 'package:fashion_app/view/pages/sign_up/widget/user_email_pass_forms_widget.dart';
import 'package:fashion_app/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FrontWidgetSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.65,
          maxWidth: double.infinity),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(80), bottomLeft: Radius.circular(80))),
      child: _buildFrontWidgets(context),
    );
  }

  Widget _buildFrontWidgets(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FormsWidget(),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return CustomButtonWidget(
                    txt: 'Submit',
                    onPress: () {
                      if (context
                          .read<SignUpCubit>()
                          .formKey2
                          .currentState!
                          .validate()) {
                        // print('ff');
                        // print(context.read<SignUpCubit>().userController.text);
                        // print(context
                        //     .read<SignUpCubit>()
                        //     .emailController
                        //     .text);
                        // print(context
                        //     .read<SignUpCubit>()
                        //     .passController
                        //     .text);

                        return context.read<SignUpCubit>().signUp(
                            userName:
                                context.read<SignUpCubit>().userController.text,
                            email: context
                                .read<SignUpCubit>()
                                .emailController
                                .text,
                            password: context
                                .read<SignUpCubit>()
                                .passController
                                .text);

                      }
                      return null;
                    });
              },
            )
          ],
        ),
      );
}
