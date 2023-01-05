import 'package:dio/src/response.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/signIn_repository.dart';

import '../../core/utils/end_pints.dart';

class SignInImplement implements SignInRepository {
  DioHelper dio;
  SignInImplement({required this.dio});

  @override
  Future<Response?> signIn({required String email, required String pass})async {
      return await dio.postData(url: signInEndPoint, data: {"email":email,
        "password":pass});

  }


}
