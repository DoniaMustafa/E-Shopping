import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/data/models/singel_prod_model.dart';
import 'package:fashion_app/data/repositories/single_product_repository.dart';
import 'package:meta/meta.dart';

part 'single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  SingleProductCubit(this.repository) : super(SingleProductInitial());
  final SingleProductRepository repository;
  SingleProdModel? singleProd;

  Future<Response?> getSingleProduct({required String prodId}) async {
    emit(LoadingState());
    return await repository
        .getSingleProduct(token: myToken!, prodId: prodId)
        .then((value) {
      singleProd = singleProdModelFromMap(value.toString());
print(value!.data);
      emit(SuccessState(singleProd!));
    }).catchError((error) {
      emit(ErrorState(error.toString()));
    });
  }
}
