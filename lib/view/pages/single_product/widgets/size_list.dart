import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/single_product/single_product_bloc/single_product_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeList extends StatelessWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child:  BlocBuilder<SingleProductCubit, SingleProductState>(
        builder: (context, state) {
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              context
                  .read<SingleProductCubit>()
                  .singleProd!
                  .product!
                  .productOptions!
                  .productSizes!
                  .length,
                  (index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      backgroundColor: white,
                      child: CustomTextWidget(
                        txt: context
                            .read<SingleProductCubit>()
                            .singleProd!
                            .product!
                            .productOptions!
                            .productSizes![index],
                        style: textThemeData.bodyText1!.copyWith(color: black),
                      ),
                    ),
                  ),
            ),
          );
        },
      ),
    );
  }
}
