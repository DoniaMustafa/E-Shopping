import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/data/repositories/add_product_repository.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'add_prod_state.dart';

class AddProdCubit extends Cubit<AddProdState> {
  AddProdCubit(this.repository) : super(AddProdInitial());
  final AddProductRepository repository;

  final List<TextEditingController> listProdPricesController = [];
  final List<TextEditingController> listProdColorController = [];
  final List<TextEditingController> listProdVariantColorNameController = [];
  final List<TextEditingController> listProdVariantColorSizeController = [];

  int numberOfTextFields = 1;

  bool? isVisible = true;
  int sizeCount = 0;
  int colorCount = 1;
  int variantIndex = 1;
  final listOfVariants = [];
  final listOfProdSize = [];
  XFile? image;
  String fileName = '';
  ImagePicker? imagePicker = ImagePicker();
  MultipartFile? multipartFile;
  List multipartImageList = [];
  List<File>? imgeFile = [];
  bool isColorVisible = true;

  List<bool> isVariantVisible = [];
  bool? variantVisible = true;
  var indexControllersVariant = 0;
  var indexControllersProdColor = 0;

  Future uploadImages() async {
    image = await imagePicker!.pickImage(source: ImageSource.gallery);
    multipartFile = await MultipartFile.fromFile(image!.path,
        filename: image!.name, contentType: MediaType('image', 'jpg'));
    multipartImageList.add(multipartFile!);
    // imgeFile!.add(File(image!.path));
  }


  pushSingleSizeInListAndIncreaseSizeCount() {
    sizeCount++;
    listOfProdSize.add(prodSize!.text);
    getVariantIndex();

    print('sizeCount : $sizeCount');
    print(listOfProdSize);
    emit(AddSizeProdState());
  }

  increaseColorCount() {
    colorCount++;
    getVariantIndex();

    print(colorCount);
    emit(CreaseCountProdState());
  }

  getVariantIndex() {
    if (sizeCount >= 1) {
      variantIndex = sizeCount * colorCount;
    } else if (colorCount <= 1 && sizeCount <= 0) {
      variantIndex = 1;
    }
    isVariantVisible = List.filled(variantIndex, variantVisible!);
    print(variantIndex);
    emit(GetVariantProdState());
  }

  createControllers() {
    increaseColorCount();
    getVariantIndex();
    for (indexControllersVariant;
        indexControllersVariant < variantIndex;
        indexControllersVariant++) {
      listProdPricesController.add(TextEditingController());
      listProdVariantColorNameController.add(TextEditingController());
      listProdVariantColorSizeController.add(TextEditingController());
    }

    for (indexControllersProdColor;
        indexControllersProdColor <= colorCount++;
        indexControllersProdColor++) {
      listProdColorController.add(TextEditingController());
    }
    print('indexControllersProdColor : $indexControllersProdColor');
    print('indexControllersVariant : $indexControllersVariant');

    emit(TextEditingControllerState());
  }

  visibleVariantWidget(int index) {
    for (int i = 0; i < isVariantVisible.length; i++) {
      if (i == index) {
        isVariantVisible[index] = true;
        // variantVisible =true;
        // v =isVariantVisible[index];
        // isVariantVisible = List.filled(4, v!);
        variantVisible == isVariantVisible[index];
        // print('var : $variantVisible');
        //
        // print(isVariantVisible[index]);
        // print('is :  $isVariantVisible');
        // print(prodPrice);
      } else {
        isVariantVisible[index] = false;

        variantVisible = isVariantVisible[index];
      }
      // print(prodPrice);
      // print(isVariantVisible);

      emit(VisibleVariantWidgetState());
    }
  }

  visibleColorWidget() {
    isColorVisible = !isColorVisible;
    emit(VisibleColorWidgetState());
  }

  //Image config

  Future<Response?> putNewProd() async {
    emit(LoadingAddNewProdState());
    return await repository
        .postNewProduct(
            variantColorName:
                listProdVariantColorNameController[colorCount - 1].text,
            variantSize:
                listProdVariantColorSizeController[indexControllersVariant - 1]
                    .text,
            prodName: prodName!.text,
            colorImg: multipartImageList,
            colorName:
                listProdColorController[indexControllersProdColor - 1].text,
            size: prodSize!.text,
            variantPrice:
                listProdPricesController[indexControllersVariant - 1].text,
            sizeIndex: sizeCount,
            colorIndex: colorCount - 1,
            variantIndex: indexControllersVariant)
        .then((value) {
      print('val: ${value!.data}');
      emit(SuccessAddNewProdState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddNewProdState(error.toString()));
    });
  }

  bool? visible() {
    isVisible = !isVisible!;
    emit(VisibleOptionalProdState());
    return isVisible;
  }
}
