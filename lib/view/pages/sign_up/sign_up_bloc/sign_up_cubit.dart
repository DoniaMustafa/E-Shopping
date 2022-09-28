import 'package:bloc/bloc.dart';
import 'package:fashion_app/data/repositories/signUp_repository.dart';
import 'package:flutter/material.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repository) : super(SignUpInitial());
  final SignUpRepository repository;
  final formKey2 = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isShow = false;
  isSelect() {
    isShow =!isShow;
    emit(ShowState());
  }

   Future signUp({required String userName,required String email,required String password}) async {
    emit(LoadState());
     return await repository
        .signUp(
      email: email,
      userName: userName,
      password: password,
    ).then((value) {
      print('val : ${value!.data}');
      print('done');
      emit(SuccessState());
    }).catchError((error) {
      print('err : ${error.toString()}');
      emit(ErrorState(error.toString()));
    });
  }
}
