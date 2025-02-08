import 'package:flutter/material.dart';
import 'package:mobilicis_task/utils/app_routes.dart';
import 'package:mobilicis_task/view/splash/splash_view.dart';

void main() {
  runApp(const Mobilicis());
}

class Mobilicis extends StatelessWidget {
  const Mobilicis({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: AppRoutes.routes,
      home: const SplashView(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
