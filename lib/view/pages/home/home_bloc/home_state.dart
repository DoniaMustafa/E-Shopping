part of 'home_cubit.dart';

abstract class HomeState {
final String? error;
AllProductModel? allProductModel;

HomeState({this.error,this.allProductModel});
}

class HomeInitial extends HomeState {}
class LoadState extends HomeState {}
class SuccessState extends HomeState {
  SuccessState(  AllProductModel? allProductModel):super(allProductModel: allProductModel);
}
class ErrorState extends HomeState {
  ErrorState(String error):super(error: error);

}

