import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/home/widget/icons_menu_and_cart_widget.dart';
import 'package:fashion_app/view/widgets/custom_circal_Shep_wiget.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class DetailsOfDeepWidget extends StatelessWidget {

TextEditingController controller=TextEditingController();

  DetailsOfDeepWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: deepBlue,
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const IconsMenuAndCartWidget(),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormWidget(txtField: 'Search', controller: controller, val: '', icon: Icons.search),
          const SizedBox(
            height: 30.0,
          ),
          CustomTextWidget(
              txt: 'Top Category', style: textThemeData.headline6!),
          const SizedBox(
            height: 30.0,
          ),
          _buildWrapWidgets(),
          const SizedBox(
            height: 30.0,
          ),
          CustomTextWidget(
              txt: 'Popular Products', style: textThemeData.headline6!)
        ],
      ),
    );
  }

  _buildWrapWidgets() => Container(
        constraints:
            const BoxConstraints(maxWidth: double.infinity, maxHeight: 50.0),
        child: ListView.builder(
            itemCount: departmentsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) => Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CustomCircleShapeWidget(
                  txt: departmentsList[index].departmentName,
                  isIcon: false,
                  image: departmentsList[index].image,
                ))),
      );
}
