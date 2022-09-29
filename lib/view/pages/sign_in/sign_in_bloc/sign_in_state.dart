part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {
  final  UserModel? userData;
  final String? error;

  SignInState({this.userData, this.error});
}

class SignInInitial extends SignInState {}

class LoadState extends SignInState {}

class SuccessState extends SignInState {
  SuccessState(UserModel? userData):super(userData: userData);
}

class ErrorState extends SignInState {
  ErrorState(String error):super(error: error);
}

class ShowState extends SignInState {}
