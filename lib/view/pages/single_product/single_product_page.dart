import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/single_product/single_product_bloc/single_product_cubit.dart';
import 'package:fashion_app/view/pages/single_product/widgets/details_widget.dart';
import 'package:fashion_app/view/widgets/custom_circal_Shep_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductPage extends StatefulWidget {
  SingleProductPage({Key? key, required this.data}) : super(key: key);
  Data? data;

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<SingleProductCubit>()
        ..getSingleProduct(prodId: widget.data!.id.toString()),
      child: Material(
        child: BlocBuilder<SingleProductCubit, SingleProductState>(
          builder: (context, state) {
            if (state is SuccessState && state.singleProd != null) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Hero(
                    tag: widget.data!.tag!,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            di<SingleProductCubit>()
                                .singleProd!
                                .product!
                                .productOptions!
                                .productColors![0]
                                .colorImages![0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 15.0,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CustomCircleShapeWidget(
                          txt: 'Back',
                          isIcon: true,
                          icon: Icons.arrow_back_ios),
                    ),
                  ),
                  const DetailsSingleProdWidget()
                ],
              );
            } else if (state is ErrorState && state.singleProd == null) {
              return const CircularProgressIndicator();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
