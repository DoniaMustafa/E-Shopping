import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/pages/add_product/widgets/full_color_name_and_imge_widgets.dart';
import 'package:fashion_app/view/pages/add_product/widgets/full_descript_widgets.dart';
import 'package:fashion_app/view/pages/add_product/widgets/full_name_widget.dart';
import 'package:fashion_app/view/pages/add_product/widgets/full_price_widget.dart';
import 'package:fashion_app/view/pages/add_product/widgets/full_size_widget.dart';
import 'package:fashion_app/view/pages/add_product/widgets/optional_variant_widgets.dart';
import 'package:fashion_app/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
int? v;
class AppProductWidgets extends StatelessWidget {
  AppProductWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 250.0, right: 20.0, left: 25.0, bottom: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FullNameWidget(),
            const SizedBox(
              height: 20.0,
            ),
            // const FullPriceWidget(),
            // const SizedBox(
            //   height: 15.0,
            // ),
            const FullSizeWidget(),
            const SizedBox(
              height: 15,
            ),
            const FullColorNameAndImageWidgets(),
            const SizedBox(
              height: 15,
            ),
            const OptionalVariantWidgets(),
            const SizedBox(
              height: 15,
            ),
            const FullDescriptionWidgets(),
            const SizedBox(
              height: 50,
            ),
            CustomButtonWidget(
                txt: 'Submit',
                onPress: () => context.read<AddProdCubit>().putNewProd()),
          ],
        ));
  }
}
