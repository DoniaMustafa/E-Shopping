import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/data/models/uesr_model.dart';
import 'package:fashion_app/data/models/user_details_model.dart';
import 'package:fashion_app/data/repositories/my_profile_repository.dart';
import 'package:meta/meta.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit(this.repository) : super(MyProfileInitial());
  MyProfileRepository repository;
  UserDetailsModel? userInfo;

  getMyInfo() async {
    emit(LoadMyProfileState());
    return await repository.getMyInfo(token: myToken!).then((value) {
      userInfo=UserDetailsModel.fromJson(json.decode(value.toString()));
      print(userInfo);
      emit(SuccessMyProfileState(userInfo));
    }).catchError((error) {
      print('error : ${error.toString()}');
      emit(ErrorState(error.toString()));
    });
  }
}
