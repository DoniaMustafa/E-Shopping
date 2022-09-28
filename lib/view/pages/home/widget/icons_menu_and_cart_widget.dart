import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/pages/home/home_page.dart';
import 'package:fashion_app/view/widgets/custom_circal_Shep_wiget.dart';
import 'package:fashion_app/view/widgets/custom_circle_icon_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconsMenuAndCartWidget extends StatelessWidget {
  const IconsMenuAndCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMenuWidget(),
            const SizedBox(
              height: 25.0,
            ),
            _buildUserNameWidget(),
          ],
        ),
        _buildCartWidget(),
      ],
    );
  }

  Widget _buildMenuWidget() => BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return GestureDetector(
      onTap: ()=>context.read<HomeCubit>().getAllProduct(),
      child: const CustomCircleShapeWidget(txt: 'Menu',isIcon:true ,icon: Icons.menu,));
  },
);

  Widget _buildUserNameWidget() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        constraints: const BoxConstraints(maxHeight: 60.0),
        child: Row(
          children: [
            CustomTextWidget(
                style: textThemeData.headline6!.copyWith(color: white),
                txt: 'Welcome '),
            CustomTextWidget(
                style: textThemeData.headline6!.copyWith(color: gray),
                txt: 'Donia Mostafa')
          ],
        ),
      );
  Widget _buildCartWidget() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        constraints: const BoxConstraints(maxHeight: 120.0, maxWidth: 70.0),
        decoration: BoxDecoration(
          color: gray.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          children: [
             CustomCircleIconWidget(
            icon: Icons.favorite_border,
        ),

            const SizedBox(
              height: 15.0,
            ),
            RotatedBox(
              quarterTurns: 1,
              child: CustomTextWidget(
                  txt: 'Cart', style: textThemeData.subtitle2!),
            )
          ],
        ),
      );
}
