import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:mobilicis_task/view/home/home_view.dart';

class SplashView extends StatefulWidget {
  static const route = 'splash';
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3200), () {
      Navigator.pushReplacementNamed(context, HomeView.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/gifs/Splash.json',
          width: 500,
          height: 500,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
