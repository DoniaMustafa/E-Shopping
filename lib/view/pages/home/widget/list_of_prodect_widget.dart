
import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/widgets/custom_list_product_widget.dart';
import 'package:fashion_app/view/widgets/custom_shimmer_loading/Loding_widget.dart';
import 'package:fashion_app/view/widgets/custom_shimmer_loading/custom_shimmer_wigget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class ListOfProductHomeWidget extends StatelessWidget {
  const ListOfProductHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 410.0, 20.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return GridView.custom(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  pattern: [
                    const WovenGridTile(1),
                    const WovenGridTile(
                      4 / 5,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                    childCount: state is SuccessState && state.allProductModel !=null ?context
                        .watch<HomeCubit>()
                        .allProductModel!
                        .products!
                        .length:10,
                    (context, index) {
                      if(state is SuccessState && state.allProductModel !=null){
                      return CustomItemProduct(

                          onTap: () => Navigator.pushNamed(
                            context,
                            '/singleProd',
                            arguments: {

                            }
                          ),
                          index: index,
                          price: context
                              .read<HomeCubit>()
                              .allProductModel!
                              .products![index]
                              .productVariants![0]
                              .variantPrice
                              .toString(),
                          prodImg: context
                              .read<HomeCubit>()
                              .allProductModel!
                              .products![index]
                              .productOptions!
                              .productColors![0]
                              .colorImages![0],
                          prodName: context
                              .read<HomeCubit>()
                              .allProductModel!
                              .products![index]
                              .productName
                              .toString(),
                        );}
                      else if (state is LoadState&& state.allProductModel ==null){
                        return const LoadingWidget();
                      }
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
