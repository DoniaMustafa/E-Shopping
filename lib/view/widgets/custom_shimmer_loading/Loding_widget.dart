import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/view/widgets/custom_shimmer_loading/custom_shimmer_wigget.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color:  white,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              flex: 2,
              child:  CustomShimmerWidget.rectangular(height: 150)
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
                  CustomShimmerWidget.rectangular(height: 20,width: 150,),
                  const SizedBox(height: 10.0,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomShimmerWidget.rectangular(height: 20,width: 100,),
                      const Spacer(
                        flex: 1,
                      ),
                      CustomShimmerWidget.rectangular(height: 10,width: 10,)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}