part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {
  final  UserInfo? userData;
  final String? error;

  SignInState({this.userData, this.error});
}

class SignInInitial extends SignInState {}

class LoadState extends SignInState {}

class SuccessState extends SignInState {
  SuccessState(UserInfo? userData):super(userData: userData);
}

class ErrorState extends SignInState {
  ErrorState(String error):super(error: error);
}

class ShowState extends SignInState {}
