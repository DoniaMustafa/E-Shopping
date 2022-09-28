import 'package:dio/src/response.dart';
import 'package:fashion_app/core/utils/end_pints.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/signUp_repository.dart';

class SignUpImplement implements SignUpRepository {
  DioHelper dio;
  SignUpImplement({required this.dio});



  @override
  Future<Response?> signUp({required String userName,required String email,required String password}) async {
    return await dio.postData(url: signUpEndPoint.toString(), data: {
      "fullName": userName,
      "email": email,
      "password":password
    });
  }


}
