import 'package:fashion_app/data/datasourse/local/cache_helper.dart';
import 'package:fashion_app/data/datasourse/remote/dio_server.dart';
import 'package:fashion_app/data/repositories/add_product_repository.dart';
import 'package:fashion_app/data/repositories/get_all_product_repository.dart';
import 'package:fashion_app/data/repositories/my_profile_repository.dart';
import 'package:fashion_app/data/repositories/signIn_repository.dart';
import 'package:fashion_app/data/repositories/signUp_repository.dart';
import 'package:fashion_app/data/repositories/single_product_repository.dart';
import 'package:fashion_app/domin/implement/add_product_implement.dart';
import 'package:fashion_app/domin/implement/get_all_product_implement.dart';
import 'package:fashion_app/domin/implement/my_profile_implement.dart';
import 'package:fashion_app/domin/implement/signIn_implement.dart';
import 'package:fashion_app/domin/implement/signUp_implement.dart';
import 'package:fashion_app/domin/implement/single_product_impelment.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_bloc/add_prod_cubit.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/pages/my_profile/my_profile_bloc/my_profile_cubit.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in_bloc/sign_in_cubit.dart';
import 'package:fashion_app/view/pages/sign_up/sign_up_bloc/sign_up_cubit.dart';
import 'package:fashion_app/view/pages/single_product/single_product_bloc/single_product_cubit.dart';
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

  di.registerLazySingleton<HomeCubit>(
      () => HomeCubit(di<GetAllProductRepository>()));

  //singleProduct
  di.registerLazySingleton<SingleProductRepository>(
      () => SingleProductImplement(di<DioHelper>()));
  di.registerLazySingleton<SingleProductCubit>(
      () => SingleProductCubit(di<SingleProductRepository>()));

  //myProfile
  di.registerLazySingleton<MyProfileRepository>(
      () => MyProfileImplement(di<DioHelper>()));
  di.registerSingleton<MyProfileCubit>(MyProfileCubit(di<MyProfileRepository>()));

//add product
  di.registerLazySingleton<AddProductRepository>(
          () => AddProductImplement(di<DioHelper>()));
  di.registerSingleton<AddProdCubit>(AddProdCubit(di<AddProductRepository>()));
}
