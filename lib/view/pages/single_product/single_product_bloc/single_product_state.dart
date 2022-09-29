part of 'single_product_cubit.dart';

@immutable
abstract class SingleProductState {
  final String? exception;
  final SingleProdModel? singleProd;

  const SingleProductState({this.exception, this.singleProd});
}

class SingleProductInitial extends SingleProductState {}

class LoadingState extends SingleProductState {}

class SuccessState extends SingleProductState {
  const SuccessState(SingleProdModel singleProd)
      : super(singleProd: singleProd);
}

class ErrorState extends SingleProductState {
  const ErrorState(String exception) : super(exception: exception);
}
