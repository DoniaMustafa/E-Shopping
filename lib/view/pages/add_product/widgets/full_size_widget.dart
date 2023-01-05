import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_button_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:fashion_app/view/widgets/custom_wrap_widget.dart';
import 'package:fashion_app/view/widgets/required_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constant.dart';

class FullSizeWidget extends StatelessWidget {
  const FullSizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomTextWidget(
              txt: 'Add Size',
              style: textThemeData.subtitle1!
                  .copyWith(color: black.withOpacity(0.6)),
            ),
            buildRequiredIcon(),
            const Spacer(
              flex: 1,
            ),
            CustomTextButtonWidget(
              text: 'Add',
              style: textThemeData.bodyText2!.copyWith(color: black),
              onPress: () => context
                  .read<AddProdCubit>()
                  .pushSingleSizeInListAndIncreaseSizeCount(),
            ),
          ],
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
                controller:prodSize!,
                val: 'Please enter Size',
                isAddProd: true,
                isPass: false,
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child: BlocBuilder<AddProdCubit, AddProdState>(
            builder: (context, state) {
              return CustomWrapWidget(
                text: context.read<AddProdCubit>().listOfProdSize,
                lengthList:
                context.read<AddProdCubit>().listOfProdSize.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
