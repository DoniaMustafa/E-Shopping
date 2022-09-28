import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/widgets/custom_circal_Shep_wiget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../widgets/custom_circle_icon_widget.dart';

class ListOfProductWidget extends StatelessWidget {
  const ListOfProductWidget({Key? key}) : super(key: key);

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
                     4/ 5,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: context.watch<HomeCubit>().allProductModel!.products!.length,
                  (context, index) => Container(
                    decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: NetworkImage(
                                context.read<HomeCubit>().allProductModel!.products![index].productOptions!.productColors![0].colorImages![0],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                    line: 1,
                                    style: textThemeData.subtitle1!
                                        .copyWith(color: black),
                                    txt: context.read<HomeCubit>().allProductModel!.products![index].productName.toString()),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    BlocBuilder<HomeCubit, HomeState>(
                                      builder: (context, state) {
                                        return CustomTextWidget(
                                            style: textThemeData.bodyText2!
                                                .copyWith(color: black),
                                            txt: '${context.read<HomeCubit>().allProductModel!.products![index].productVariants![0].variantPrice} \$');
                                      },
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                     CustomCircleIconWidget(icon: Icons.favorite,isIList:true,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
