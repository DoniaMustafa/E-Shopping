import 'package:fashion_app/config/color.dart';
import 'package:flutter/material.dart';

class CustomCircleIconWidget extends StatelessWidget {
    CustomCircleIconWidget({Key? key,required this.icon,this.isIList = false}) : super(key: key);

bool isIList;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: isIList ?15.0:20.0,
      backgroundColor: isIList?Colors.transparent:white,
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Icon(
          icon,
          color:isIList ?Colors.red[900]: gray,
          size: 25,
        ),
      ),
    );
  }
}
