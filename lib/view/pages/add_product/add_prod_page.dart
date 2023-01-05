import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/pages/add_product/widgets/add_product_widgets.dart';
import 'package:fashion_app/view/pages/add_product/widgets/top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocProvider(
              create: (context) => di<AddProdCubit>()..getVariantIndex()..createControllers(),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const TopWidget(),
                  AppProductWidgets()

                ],
              ),
            )),
      ),
    );
  }
}
