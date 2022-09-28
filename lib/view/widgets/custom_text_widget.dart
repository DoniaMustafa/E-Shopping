import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key, required this.txt, required this.style,this.line=2})
      : super(key: key);
  final String txt;
  final TextStyle style;
  final int line ;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: style,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
    );
  }
}
