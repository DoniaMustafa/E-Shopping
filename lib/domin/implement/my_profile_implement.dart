import 'package:dio/dio.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/core/utils/end_pints.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/my_profile_repository.dart';

class MyProfileImplement implements MyProfileRepository{
  final DioHelper dio;

  MyProfileImplement(this.dio);

  @override
  Future<Response?> getMyInfo({required String token}) async{
    return await dio.getData(url: userInfoEndPoint,token: token);
  }




}