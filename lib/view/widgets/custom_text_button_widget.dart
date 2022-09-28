import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  const CustomTextButtonWidget({Key? key, this.onPress, required this.text,  this.style}) : super(key: key);
final  onPress;
final String text;
final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onPress, child: CustomTextWidget(
      txt: text,
      style:style!,
    ));
  }
}
