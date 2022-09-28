import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class BackgroundSignupWidget extends StatelessWidget {
  const BackgroundSignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 8, top: 15),
          alignment: Alignment.topLeft,
          height: 300,
          color: const Color(0xFF0A0D33),
          child: Column(
            children: [
              _buildPreviousWidget(context),
              SizedBox(
                height: 30,
              ),
              CustomTextWidget(
                  txt: 'Create a new account',
                  style: textThemeData.headline4!),
              const SizedBox(
                height: 15,
              ),
              CustomTextWidget(
                  txt: 'Please put your information below to create\n a new account for using app',
                  style: textThemeData.bodyText2!),            ],
          ),
        ),
        Container(
          height: 230,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/GUI/background2.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  _buildPreviousWidget(context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25.0,
            ),
          ),
          CustomTextWidget(
              txt: 'Back',
              style: textThemeData.headline6!)
        ],
      );
  // _buildSubTitleWidget() => RichText(
  //       text: TextSpan(children: [
  //         TextSpan(text: 'Please put your information below to create'),
  //         TextSpan(text: 'a new account for using app')
  //       ]),
  //     );
}
