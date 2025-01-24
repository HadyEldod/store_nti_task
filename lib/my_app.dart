import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/cart/cubit/cubit/cart_cubit.dart';
import 'feature/category/view/screen/splash_screen.dart';
import 'feature/fav/cubit/favourite_cubit.dart';
import 'feature/registeration/cubit/cubit/register_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => CartCubit(),
          ),
          BlocProvider(
            create: (context) => FavouriteCubit(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: const SplashScreen()),
      ),
    );
  }
}