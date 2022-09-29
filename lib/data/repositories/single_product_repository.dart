import 'package:dio/dio.dart';

abstract class SingleProductRepository{
  Future<Response?> getSingleProduct({required String token,required String prodId});
}