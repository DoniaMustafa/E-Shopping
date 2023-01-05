import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomWrapWidget extends StatelessWidget {
  const CustomWrapWidget({Key? key, required this.lengthList, required this.text}) : super(key: key);
 final int lengthList;
 final List text;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      spacing: 10.0,
      children: List.generate(
        lengthList,
        (index) => Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: gray.withOpacity(0.6))),
              child: CustomTextWidget(
                txt: text[index],
                style: textThemeData.bodyText1!.copyWith(color: black),
              ),
            ),
            const CircleAvatar(
                radius: 8,
                backgroundColor: gray,
                child: Icon(
                  Icons.close,
                  color: white,
                  size: 12,
                ))
          ],
        ),
      ),
    );
  }
}
