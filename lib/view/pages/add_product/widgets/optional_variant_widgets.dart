import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/widgets/custom_card_light_grey_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:fashion_app/view/widgets/custom_title_and_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class OptionalVariantWidgets extends StatelessWidget {
  const OptionalVariantWidgets({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleAndIconWidget(
            icon: Icons.keyboard_arrow_down,
            title: 'Product Variants',
            isIconList: false,
            press: () => context.read<AddProdCubit>().visible(),
            isRequired: false),
        BlocBuilder<AddProdCubit, AddProdState>(
          builder: (context, state) {
            return Container(
              color: gray.withOpacity(0.1),
              padding:const EdgeInsets.symmetric(vertical: 10),
              child: Visibility(
                visible: context.read<AddProdCubit>().isVisible!,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                      context.read<AddProdCubit>().variantIndex,
                      (index) => _buildSingleVariant(index,context) ,


                      ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  _buildSingleVariant(int index,context) => CustomCardLightGreyWidget(
                      press: () {

                        context.read<AddProdCubit>().visibleVariantWidget(index);
                      },
                      child: Visibility(
                        visible: di<AddProdCubit>().isVariantVisible[index],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              txt: 'Price',
                              style: textThemeData.subtitle1!
                                  .copyWith(color: black.withOpacity(0.6)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            BlocBuilder<AddProdCubit, AddProdState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: 200.0,
                                  child: CustomTextFormWidget(
                                    onChanged: (v) {
                                      // v = prodPrices!.text;
                                    },
                                    txtField: '',
                                    controller:  context.read<AddProdCubit>().listProdPricesController[index],
                                    val: '',
                                    isAddProd: true,
                                    isPass: false,
                                  ),
                                );
                              },
                            ),
                            CustomTextWidget(
                              txt: 'Size',
                              style: textThemeData.subtitle1!
                                  .copyWith(color: black.withOpacity(0.6)),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: 200.0,
                              child: BlocBuilder<AddProdCubit, AddProdState>(
                                builder: (context, state) {
                                  return CustomTextFormWidget(
                                    txtField: '',
                                    controller: context.read<AddProdCubit>().listProdVariantColorSizeController[index],
                                    val: '',
                                    isAddProd: true,
                                    isPass: false,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextWidget(
                              txt: 'Color Name',
                              style: textThemeData.subtitle1!
                                  .copyWith(color: black.withOpacity(0.6)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 200.0,
                              child: BlocBuilder<AddProdCubit, AddProdState>(
                                builder: (context, state) {
                                  return CustomTextFormWidget(
                                    txtField: '',
                                    controller: context.read<AddProdCubit>().listProdVariantColorNameController[index],
                                    val: '',
                                    isAddProd: true,
                                    isPass: false,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

}
