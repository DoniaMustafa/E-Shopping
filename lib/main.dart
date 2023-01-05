import 'package:fashion_app/config/them_data.dart';
import 'package:fashion_app/core/route/route_gonfig.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/add_product/add_prod_page.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/pages/home/home_page.dart';
import 'package:fashion_app/view/pages/sign_in/sign_in.dart';
import 'package:fashion_app/view/pages/single_product/single_product_bloc/single_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dependency_injection/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  myToken = await getUserToken();
  print(myToken);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SingleProductCubit? bloc;
  BlocObserver? observer;
  @override
  void dispose() {
    bloc!.close();
    observer!.onClose(bloc!);
    print(bloc!.state);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(getUserToken().toString());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<HomeCubit>()..getAllProduct(),
        ),
        BlocProvider(
          create: (context) => di<SingleProductCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: CustomGenerateRouter.generateRoute,
        theme: themData,
        home: AddProductPage(),
      ),
    );
  }
}
