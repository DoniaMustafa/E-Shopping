import 'package:dio/dio.dart';

abstract class MyProfileRepository{
  Future<Response?>getMyInfo({required String token});

}