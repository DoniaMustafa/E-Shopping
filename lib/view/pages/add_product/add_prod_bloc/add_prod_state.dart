part of 'add_prod_cubit.dart';

@immutable
abstract class AddProdState {
  final String? error;

  AddProdState({this.error});
}

class AddProdInitial extends AddProdState {}
class LoadingAddNewProdState extends AddProdState {}
class SuccessAddNewProdState extends AddProdState {}
class ErrorAddNewProdState extends AddProdState {
  ErrorAddNewProdState(String error):super(error: error);
}
class CreaseCountProdState extends AddProdState {}
class VisibleOptionalProdState extends AddProdState {}
class PickFileProdState extends AddProdState {}
class AddNewProdState extends AddProdState {}
class AddSizeProdState extends AddProdState {}
class GetVariantProdState extends AddProdState {}
class VisibleColorWidgetState extends AddProdState {}
class VisibleVariantWidgetState extends AddProdState {}
class TextEditingControllerState extends AddProdState {}