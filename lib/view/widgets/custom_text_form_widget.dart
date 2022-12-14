import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/text_style.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in_bloc/sign_in_cubit.dart';
import 'package:fashion_app/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget(
      {Key? key,
        this.onChanged,
      required this.txtField,
      required this.controller,
      required this.val,
      this.isPass = false,
      this.isShow = false,
      this.onTap,
       this.icon,
        this.line=1,
      this.isAddProd =false})
      : super(key: key);
  final String txtField;
  final TextEditingController controller;
  final String val;
  final bool? isPass;
  final bool isShow;
  final onTap;
  final  onChanged;
  final IconData? icon;
  final bool isAddProd;
  final int line;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (String i)=>onChanged,
      maxLines: line,
      obscureText: isShow,
      controller: controller,
      validator: (String? validate) {
        if (validate!.isEmpty) {
          return val;
        }
      },
      decoration: InputDecoration(
        filled:isAddProd?true:false ,
          focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(color: isAddProd? white:deepBlue), borderRadius: BorderRadius.circular(10.0),) ,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: white),
              borderRadius: BorderRadius.circular(10.0),
              gapPadding: 10.0),
          border: OutlineInputBorder(borderSide:BorderSide(color:white),
              borderRadius: BorderRadius.circular(10.0), gapPadding: 10.0),
          label: CustomTextWidget(
            txt: txtField,
            style: textThemeData.bodyText1!,
          ),
          prefixIcon:isAddProd?null: Icon(
            icon,
            size: 25,
          ),
          suffixIcon: isPass!
              ? GestureDetector(
                  onTap: onTap,
                  child: Icon(isShow ? Icons.visibility_off : Icons.visibility))
              : null,
          constraints: const BoxConstraints(
            maxWidth: 400,
          )),
    );
  }
}
