
import 'package:dio/dio.dart';

abstract class AddProductRepository {

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
        required int variantIndex
      });
}
