import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/core/utils/end_pints.dart';
import 'package:fashion_app/data/datasourse/local/cache_helper.dart';
import 'package:fashion_app/data/models/uesr_model.dart';
import 'package:fashion_app/data/repositories/signIn_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.repository) : super(SignInInitial());
  SignInRepository repository;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isShow = false;
  bool? showPass() {
    isShow = !isShow;
    emit(ShowState());
  }

  UserModel? userData;

  login(context) async {
    emit(LoadState());
    return await repository
        .signIn(email: emailController.text, pass: passController.text)
        .then((value) {
      userData = userInfoFromJson(value.toString());
      print(value!.data);
      emit(SuccessState(userData));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorState(error.toString()));
    });
  }
}


