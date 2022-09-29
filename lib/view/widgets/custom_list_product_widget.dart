import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/widgets/custom_circle_icon_widget.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomItemProduct extends StatelessWidget {
  CustomItemProduct({
    Key? key,
    required this.onTap,
    required this.price,
    required this.prodName,
    required this.prodImg,
    required this.index,
  }) : super(key: key);

  final Function onTap;
  final String price;
  final String prodName;
  final String prodImg;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Hero(
        tag: index,
        child: Container(
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
                  child: FadeInImage(
                    placeholder: AssetImage('assets/GUI/shirt/shirt1.jpg'),
                    image: NetworkImage(prodImg),
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
                          style:
                              textThemeData.subtitle1!.copyWith(color: black),
                          txt: prodName),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextWidget(
                              style: textThemeData.bodyText2!
                                  .copyWith(color: black),
                              txt: '$price \$'),
                          const Spacer(
                            flex: 1,
                          ),
                          CustomCircleIconWidget(
                            icon: Icons.favorite,
                            isIList: true,
                          )
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
  }
}
