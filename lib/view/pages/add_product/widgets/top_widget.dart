import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_circal_Shep_wiget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
      padding:
      const EdgeInsets.only(top: 50, left: 15.0, right: 15.0),
      height: 200,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0)),
          color: deepBlue),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 140.0,
                  child: CustomCircleShapeWidget(
                    // style: textThemeData.subtitle1!.copyWith(color: black),
                    txt: 'BACK',
                    isIcon: true,
                    icon: Icons.arrow_back_ios,
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              const Icon(
                Icons.notifications,
                color: white,
                size: 30.0,
              )
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Center(
            child: CustomTextWidget(
              txt: 'Add New Product',
              style: textThemeData.headline4!,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
