import 'package:fashion_app/view/pages/home/widget/details_of_deep_widget.dart';
import 'package:fashion_app/view/pages/home/widget/list_of_prodect_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Stack(
            children: [
              DetailsOfDeepWidget(),
              const ListOfProductWidget()
            ],
          ),
        ),
      ),
    );
  }
}
