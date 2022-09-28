part of 'home_cubit.dart';

abstract class HomeState {
final String? error;

HomeState({this.error});
}

class HomeInitial extends HomeState {}
class LoadState extends HomeState {}
class SuccessState extends HomeState {}
class ErrorState extends HomeState {
  ErrorState(String error):super(error: error);

}

