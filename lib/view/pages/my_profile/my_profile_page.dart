import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/view/pages/my_profile/my_profile_bloc/my_profile_cubit.dart';
import 'package:fashion_app/view/pages/my_profile/widget/deep_widget.dart';
import 'package:fashion_app/view/pages/my_profile/widget/list_product_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<MyProfileCubit>()..getMyInfo(),
      child: Material(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              DeepWidget(),
              MyProfListProductWidget(),
              // BlocBuilder<MyProfileCubit,MyProfileState>(
              //   builder: (context,state) =>
              //      state is SuccessMyProfileState&& di<MyProfileCubit>().userInfo!.user.products.isNotEmpty
              //           ?
              //           : Center(
              //               child: CustomTextWidget(
              //                 txt: 'There is not List product',
              //                 style: textThemeData.headline6!
              //                     .copyWith(color: black),
              //               ),
              //             ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
