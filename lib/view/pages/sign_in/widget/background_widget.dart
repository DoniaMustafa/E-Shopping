import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_page.dart';
import 'package:fashion_app/view/widgets/custom_text_button_widget.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/GUI/background2.jpg',
          fit: BoxFit.cover,
          height: 250,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 50.0),
          alignment: Alignment.bottomCenter,
          height: 400,
          width: double.infinity,
          color: const Color(0xFF0A0D33),
          child: CustomTextButtonWidget(
            onPress: () => Navigator.pushNamed(context,'/signUp'),
            text: 'don’t have account? signUp now',
            style: textThemeData.bodyText1!.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
