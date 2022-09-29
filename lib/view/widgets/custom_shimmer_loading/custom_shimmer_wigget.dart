import 'package:fashion_app/config/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
final double width;
final double? height;
 CustomShimmerWidget.rectangular({
this.width = double.infinity,
   required this.height
});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor:  Colors.grey[300]!,
      child: Container(
        width: width,
        height: height,
        color: gray,
      ),
    );
  }

}
