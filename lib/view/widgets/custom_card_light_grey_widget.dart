import 'package:fashion_app/config/color.dart';
import 'package:flutter/material.dart';

class CustomCardLightGreyWidget extends StatelessWidget {
  const CustomCardLightGreyWidget(
      {Key? key, required this.child, required this.press})
      : super(key: key);
  final Widget child;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
          color: gray.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => press(),
            child: Container(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: black.withOpacity(0.6),
                size: 25,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
