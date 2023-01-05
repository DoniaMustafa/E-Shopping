import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/widgets/custom_circle_icon_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:fashion_app/view/widgets/required_icon.dart';
import 'package:flutter/material.dart';

class CustomTitleAndIconWidget extends StatelessWidget {
  CustomTitleAndIconWidget(
      {Key? key, required this.title, this.isRequired = true, required this.press, required this.isIconList, required this.icon})
      : super(key: key);
  final bool isRequired;
  final String title;
  final Function press;
  final bool isIconList;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          txt: title,
          style:
              textThemeData.subtitle1!.copyWith(color: black.withOpacity(0.6)),
        ),
        isRequired ? buildRequiredIcon() : Container(),
        const Spacer(
          flex: 1,
        ),
        GestureDetector(
          onTap: () => press(),
          child: CustomCircleIconWidget(
            icon: icon,
            isIList:isIconList,
            // style: textThemeData.bodyText1!.copyWith(color: deepBlue),
          ),
        )

      ],
    );
  }
}
