import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/data/models/user_details_model.dart';
import 'package:fashion_app/view/pages/my_profile/my_profile_bloc/my_profile_cubit.dart';
import 'package:fashion_app/view/pages/single_product/single_product_bloc/single_product_cubit.dart';
import 'package:fashion_app/view/widgets/custom_list_product_widget.dart';
import 'package:fashion_app/view/widgets/custom_shimmer_loading/Loding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyProfListProductWidget extends StatelessWidget {
  const MyProfListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProfileCubit, MyProfileState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GridView.custom(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              pattern: [
                const WovenGridTile(1),
                const WovenGridTile(
                  4 / 6,
                  crossAxisRatio: 0.8,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: state is LoadMyProfileState && state.userInfo == null
                  ? 10
                  : context
                      .read<MyProfileCubit>()
                      .userInfo!
                      .user!
                      .products!
                      .length,
              (context, index) {
                if (state is SuccessMyProfileState && state.userInfo != null) {
                  return CustomItemProduct(
                    onTap: () {
                      di<SingleProductCubit>().getSingleProduct(
                          prodId: context
                              .read<MyProfileCubit>()
                              .userInfo!
                              .user!
                              .products![index].sId!);
                      return Navigator.pushNamed(context, '/singleProd',
                          arguments: Data(
                              id: context
                                  .read<MyProfileCubit>()
                                  .userInfo!
                                  .user!
                                  .products![index]
                                  .sId,
                              tag: index));
                    },
                    index: index,
                    price: context
                        .read<MyProfileCubit>()
                        .userInfo!
                        .user!
                        .products![index]
                        .productVariants![0]
                        .variantPrice
                        .toString(),
                    prodImg: context
                        .read<MyProfileCubit>()
                        .userInfo!
                        .user!
                        .products![index]
                        .productOptions!
                        .productColors![0]
                        .colorImages![0],
                    prodName: context
                        .read<MyProfileCubit>()
                        .userInfo!
                        .user!
                        .products![index]
                        .productName
                        .toString(),
                  );
                } else if (state is LoadMyProfileState &&
                    state.userInfo == null) {
                  return const LoadingWidget();
                }
              },
            ),
          ),
        );
        // if (state is SuccessState) {
        //
        // } else {
        //   return const Center(child: CircularProgressIndicator());
        // }
      },
    );
  }
}
//
