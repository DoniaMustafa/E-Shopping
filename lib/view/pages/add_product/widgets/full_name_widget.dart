import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:fashion_app/view/widgets/required_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullNameWidget extends StatelessWidget {
  const FullNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextWidget(
              txt: 'Product Name',
              style: textThemeData.subtitle1!
                  .copyWith(color: black.withOpacity(0.6)),
            ),
            buildRequiredIcon(),
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        BlocBuilder<AddProdCubit, AddProdState>(
          builder: (context, state) {
            return CustomTextFormWidget(
              txtField: '',
              controller: prodName!,
              val: 'Please enter Product Name',
              isAddProd: true,
              isPass: false,
            );
          },
        ),

      ],
    );
  }
}
