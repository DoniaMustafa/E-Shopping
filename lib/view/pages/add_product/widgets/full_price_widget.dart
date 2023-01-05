import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/pages/add_product/widgets/optional_variant_widgets.dart';
import 'package:fashion_app/view/widgets/custom_text_form_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:fashion_app/view/widgets/required_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullPriceWidget extends StatelessWidget {
  const FullPriceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomTextWidget(
              txt: 'Price',
              style: textThemeData.subtitle1!
                  .copyWith(color: black.withOpacity(0.6)),
            ),
            buildRequiredIcon(),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        // SizedBox(
        //     width: 200.0,
        //     child: BlocBuilder<AddProdCubit, AddProdState>(
        //       builder: (context, state) {
        //         return CustomTextFormWidget(
        //           txtField: '',
        //           controller: context.read<AddProdCubit>().prodPrice[0],
        //           val: 'Please enter Price',
        //           isAddProd: true,
        //           isPass: false,
        //         );
        //       },
        //     )),
      ],
    );
  }
}
