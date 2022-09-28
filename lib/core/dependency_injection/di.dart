import 'package:fashion_app/data/datasourse/local/cache_helper.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/get_all_product_repository.dart';
import 'package:fashion_app/data/repositories/signIn_repository.dart';
import 'package:fashion_app/data/repositories/signUp_repository.dart';
import 'package:fashion_app/domin/implement/get_all_product_implement.dart';
import 'package:fashion_app/domin/implement/signIn_implement.dart';
import 'package:fashion_app/domin/implement/signUp_implement.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in_bloc/sign_in_cubit.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_bloc/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.I..allowReassignment = true;
Future init() async {
  //cache helper
  final prefs = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => prefs);
  di.registerLazySingleton<CacheHelper>(
      () => CacheImplement(di<SharedPreferences>()));

//DioHelper
  di.registerLazySingleton<DioHelper>(() => DioImplement());

  //Sign In
  di.registerLazySingleton<SignInRepository>(
      () => SignInImplement(dio: di<DioHelper>()));
  di.registerLazySingleton<SignInCubit>(
      () => SignInCubit(di<SignInRepository>()));

  //Sign Up
  di.registerLazySingleton<SignUpRepository>(
      () => SignUpImplement(dio: di<DioHelper>()));
  di.registerLazySingleton<SignUpCubit>(
      () => SignUpCubit(di<SignUpRepository>()));

  //GetAllProduct
  di.registerLazySingleton<GetAllProductRepository>(
      () => GetAllProductImplement(di<DioHelper>()));

  di.registerLazySingleton<HomeCubit>(() => HomeCubit(di<GetAllProductRepository>()));
}
