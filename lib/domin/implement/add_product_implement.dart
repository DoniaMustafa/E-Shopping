import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/core/utils/end_pints.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/add_product_repository.dart';

class AddProductImplement implements AddProductRepository {
  DioHelper dio;

  AddProductImplement(this.dio);

  @override
  Future<Response?> postNewProduct(
      {required String prodName,
      required List colorImg,
      required String colorName,
      required String size,
      required String variantPrice,
      required String variantColorName,
      required String variantSize,
      required int colorIndex,
      required int sizeIndex,
      required int variantIndex}) async {
    FormData data = FormData.fromMap({
      "productName": prodName,
      "productColors[$colorIndex][colorName]": colorName,
      "productColors[$colorIndex][colorImages]": colorImg,
      "productSizes[$sizeIndex]": size,
      "productVariations[$variantIndex][variantPrice]": variantPrice,
      // "productVariations[$variantIndex][variantAttributes][variantColor][colorName]":
      //     variantColorName,
      // "productVariations[$variantIndex][variantAttributes][variantSize]":
      //     variantSize
    });

    return await dio.postData(
        token: myToken!, url: addProductEndPoint, data: data);
  }
}
