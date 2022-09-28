import 'package:dio/dio.dart';

abstract class GetAllProductRepository{

  Future<Response?>getAllProd({required String token});
}