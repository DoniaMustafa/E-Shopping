import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/widgets/custom_card_light_grey_widget.dart';
import 'package:fashion_app/view/widgets/custom_circle_icon_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_button_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:fashion_app/view/widgets/custom_title_and_icon_widget.dart';
import 'package:fashion_app/view/widgets/required_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullColorNameAndImageWidgets extends StatelessWidget {
  const FullColorNameAndImageWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AddProdCubit, AddProdState>(
          builder: (context, state) {
            return CustomTitleAndIconWidget(
                icon: Icons.add,
                title: 'Add Color Name and color photo',
                isIconList: true,
                press: () => context.read<AddProdCubit>().increaseColorCount(),
                isRequired: true);
          },
        ),
        const SizedBox(
          height: 15.0,
        ),
        BlocBuilder<AddProdCubit, AddProdState>(builder: (context, state) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(context.read<AddProdCubit>().colorCount,
                (index) => _buildColorNameAndSelectImage(context,index)),
          );
        })
      ],
    );
  }

  _buildColorNameAndSelectImage(context,int i) =>
      BlocBuilder<AddProdCubit, AddProdState>(
        builder: (context, state) {
          return CustomCardLightGreyWidget(
            press: () => context.read<AddProdCubit>().visibleColorWidget(),
            child: Visibility(
              visible: context.read<AddProdCubit>().isColorVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        txt: 'Color Name',
                        style: textThemeData.subtitle1!
                            .copyWith(color: black.withOpacity(0.6)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150.0,
                        height: 60,
                        child: CustomTextFormWidget(
                          line: 1,
                          txtField: '',
                          controller: context.read<AddProdCubit>().listProdColorController[i],
                          val: '',
                          isAddProd: true,
                          isPass: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        txt: 'Color Image',
                        style: textThemeData.subtitle1!
                            .copyWith(color: black.withOpacity(0.6)),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      GestureDetector(
                          onTap: () =>
                              context.read<AddProdCubit>().uploadImages(),
                          child: CustomTextButtonWidget(
                            text: 'Select Image Colors',
                            style: textThemeData.bodyText1!
                                .copyWith(color: black.withOpacity(0.6)),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildListImage()
                ],
              ),
            ),
          );
        },
      );

  _buildListImage() => BlocBuilder<AddProdCubit, AddProdState>(
        builder: (context, state) {
          return SizedBox(
            height:
                context.read<AddProdCubit>().imgeFile!.isNotEmpty ? 100.0 : 0,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                context.read<AddProdCubit>().imgeFile;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.file(
                    context.watch<AddProdCubit>().imgeFile![i],
                  ),
                );
              },
              itemCount: context.watch<AddProdCubit>().imgeFile!.length,
            ),
          );
        },
      );
}
