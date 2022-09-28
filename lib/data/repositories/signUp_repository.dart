import 'package:dio/dio.dart';

abstract class SignUpRepository {

  Future<Response?> signUp({required String userName,required String email,required String password});

}
