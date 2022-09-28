import 'package:fashion_app/config/color.dart';
import 'package:fashion_app/config/them_data.dart';
import 'package:fashion_app/core/route/route_gonfig.dart';
import 'package:fashion_app/core/utils/constant.dart';
import 'package:fashion_app/view/pages/home/home_bloc/home_cubit.dart';
import 'package:fashion_app/view/pages/home/home_page.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(getUserToken().toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomGenerateRouter.generateRoute,
      theme: themData,
      home: BlocProvider(
        create: (context) => di<HomeCubit>()..getAllProduct(),
        child: const HomePage(),
      ),
    );
  }
}
