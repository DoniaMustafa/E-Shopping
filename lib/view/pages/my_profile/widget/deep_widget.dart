import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_circal_Shep_wiget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class DeepWidget extends StatelessWidget {
  const DeepWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:
      const EdgeInsets.only(top: 40, left: 20.0, right: 20.0, bottom: 10.0),
      color: deepBlue,
      constraints:
      const BoxConstraints(maxHeight: 250, maxWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              CustomCircleShapeWidget(
                txt: 'Back',
                isIcon: true,
                icon: Icons.arrow_back_ios,
              ),
              Spacer(flex: 1,),
              Icon(
                Icons.notifications_none,
                size: 30,
                color: white,
              ),
              SizedBox(
                width: 15.0,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: white,
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          CustomTextWidget(
            txt: 'My Profile',
            style: textThemeData.headline5!.copyWith(color: white),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              CustomTextWidget(
                  txt: 'Welcome',
                  style: textThemeData.bodyText1!
                      .copyWith(color: Colors.orange)),
              const SizedBox(
                width: 5.0,
              ),
              CustomTextWidget(
                  txt: 'Donia Mostafa!', style: textThemeData.bodyText1!),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomTextWidget(
            txt: 'dondondony38@gmail.com',
            style: textThemeData.bodyText1!,
          ),
        ],
      ),
    );
  }
}
