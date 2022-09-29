import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/view/pages/single_product/single_product_bloc/single_product_cubit.dart';
import 'package:fashion_app/view/pages/single_product/widgets/size_list.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsSingleProdWidget extends StatelessWidget {
  const DetailsSingleProdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      margin: const EdgeInsets.all(20.0),
      constraints: const BoxConstraints(
          maxHeight: 500, maxWidth: double.infinity),
      decoration: BoxDecoration(
        color: black.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<SingleProductCubit, SingleProductState>(
            builder: (context, state) {
              return CustomTextWidget(
                  txt: di<SingleProductCubit>()
                      .singleProd!
                      .product!
                      .productName,
                  style: textThemeData.headline6!);
            },
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            children: [
              CustomTextWidget(
                txt: 'Price  :',
                style: textThemeData.subtitle1!,
              ),
              const SizedBox(
                width: 15.0,
              ),
              BlocBuilder<SingleProductCubit, SingleProductState>(
                builder: (context, state) {
                  return CustomTextWidget(
                      txt:
                      '${di<SingleProductCubit>().singleProd!.product!.productVariants![0].variantPrice} \$',
                      style: textThemeData.subtitle1!
                          .copyWith(color: black));
                },
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                // width:100,
                child: RatingBar.builder(
                  itemSize: 25,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Divider(
            thickness: 2.0,
            color: gray.withOpacity(0.4),
          ),
          const SizedBox(
            width: 20.0,
          ),
          CustomTextWidget(
            txt: 'Size',
            style: textThemeData.subtitle1!,
          ),
          const SizeList(),
          Divider(
            thickness: 8.0,
            color: gray.withOpacity(0.4),
          ),
          const SizedBox(
            height: 15.0,
          ),
          CustomTextWidget(
              txt: 'Description', style: textThemeData.headline6!),
          const SizedBox(
            height: 15.0,
          ),
          CustomTextWidget(
            txt: 'Color:Grey\n'
                'Fabric Details:Main Fabric: 82% Polyester 14% Viscose/Rayon 4% Elastane/Spandex\n'
                'Model Dimensions:Height: 189 Weight: 81 Chest: 97 Hips: 99\n'
                'Model Clothes Size:M',
            style: textThemeData.bodyText1!,
            line: 10,
          ),
        ],
      ),
    );
  }
}
