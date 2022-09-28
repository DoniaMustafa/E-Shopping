import 'package:dio/src/response.dart';
import 'package:fashion_app/core/utils/end_pints.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/get_all_product_repository.dart';

class GetAllProductImplement implements GetAllProductRepository {
  DioHelper dioHelper;
  GetAllProductImplement(this.dioHelper);
  @override
  Future<Response?> getAllProd({required String token}) async {
    return await dioHelper
        .getData(
            url:'get-all-products',
            token:token);
  }
}
