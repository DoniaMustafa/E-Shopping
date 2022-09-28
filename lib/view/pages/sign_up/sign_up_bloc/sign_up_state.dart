part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {
  final String? exception;

  const SignUpState({this.exception});
}

class SignUpInitial extends SignUpState {}

class LoadState extends SignUpState {}

class SuccessState extends SignUpState {}

class ErrorState extends SignUpState {
  const ErrorState(String error) : super(exception: error);
}

class ShowState extends SignUpState {}
