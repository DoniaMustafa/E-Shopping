import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/data/models/all_product_model.dart';
import 'package:fashion_app/data/repositories/get_all_product_repository.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(HomeInitial());

  GetAllProductRepository repository;
  AllProductModel? allProductModel;
  Future<Response?> getAllProduct() async {
    emit(LoadState());
    return await repository.getAllProd(token: myToken!).then((value) {
      allProductModel = allProductModelFromJson(value.toString());

      emit(SuccessState(allProductModel));
    }).catchError((error) {
      emit(ErrorState(error.toString()));
    });
  }
}
