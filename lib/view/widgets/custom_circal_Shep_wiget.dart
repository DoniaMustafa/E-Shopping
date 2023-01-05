import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_circle_icon_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomCircleShapeWidget extends StatelessWidget {
  const CustomCircleShapeWidget(
      {Key? key,
      required this.txt,
      this.isIcon = false,
      this.icon,
      this.image,
      })
      : super(key: key);
  final String txt;
  final bool isIcon;
  final String? image;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        constraints: const BoxConstraints(maxHeight: 70.0,),
        decoration: BoxDecoration(
          color: gray.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          children: [
            isIcon == true
                ? GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CustomCircleIconWidget(
                      icon: icon!,
                    ),
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    child: Image.asset(
                      image!,
                      height: 60,
                      width: 35,
                      fit: BoxFit.fill,
                    ),
                  ),
            const SizedBox(
              width: 10.0,
            ),
            CustomTextWidget(txt: txt, style: textThemeData.subtitle1!),
          ],
        ));
  }
}
