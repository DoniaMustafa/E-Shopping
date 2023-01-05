import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullDescriptionWidgets extends StatelessWidget {
  const FullDescriptionWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          txt: 'Add Description',
          style: textThemeData.subtitle1!
              .copyWith(color: black.withOpacity(0.6)),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<AddProdCubit, AddProdState>(
          builder: (context, state) {
            return CustomTextFormWidget(
              line: 10,
              txtField: '',
              controller:description!,
              val: '',
              isPass: false,
              isAddProd: true,
            );
          },
        ),
      ],
    );
  }
}
