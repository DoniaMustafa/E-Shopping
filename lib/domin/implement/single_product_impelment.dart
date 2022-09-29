import 'package:dio/src/response.dart';
import 'package:fashion_app/core/utils/end_pints.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/single_product_repository.dart';

class SingleProductImplement implements SingleProductRepository{
 final DioHelper dio;

 SingleProductImplement(this.dio);

  @override
  Future<Response?> getSingleProduct({required String token, required String prodId}) async{
    return await dio.getData(url:'$productIdEndPoint/$prodId',token: token);
  }

}