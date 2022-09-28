import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key, required this.txt, required this.onPress}) : super(key: key);
  final String txt;
  final  onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(350, 50)),
        backgroundColor:
        MaterialStateProperty.all(const Color(0xFF0A0D33)),
      ),
      child: CustomTextWidget(
        txt: txt,
        style: textThemeData.headline6!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
