import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/app_routes.dart';
import 'package:mobilicis_task/view/splash/splash_view.dart';

void main() {
  runApp(const Mobilicis());
}

class Mobilicis extends StatelessWidget {
  const Mobilicis({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 800),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: AppRoutes.routes,
        home: const SplashView(),
      ),
    );
  }
}
