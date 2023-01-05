import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
   CustomButtonWidget({Key? key,this.isAddProd=false, required this.txt, required this.onPress}) : super(key: key);
  final String txt;
  bool isAddProd;
  final  onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:()=> onPress(),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all( Size(isAddProd?150:350, 50)),
        backgroundColor:
        MaterialStateProperty.all(isAddProd?white.withOpacity(0.8):deepBlue),
      ),
      child: CustomTextWidget(
        txt: txt,
        style: textThemeData.headline6!
            .copyWith(color: isAddProd?black:white),
      ),
    );
  }
}
