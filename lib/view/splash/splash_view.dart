import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobilicis_task/view/auth/account_not_found.dart';
import 'package:mobilicis_task/view/auth/login_view.dart';
import 'dart:async';

import 'package:mobilicis_task/view/auth/verify_otp.dart';
import 'package:mobilicis_task/view/home/home_view.dart';
import 'package:mobilicis_task/view/home/manager/home_cubit.dart';

class SplashView extends StatefulWidget {
  static const route = 'splash';
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    fetchData();
    // Timer(const Duration(milliseconds: 3250), () {});
  }

  Future<void> fetchData() async {
    await context.read<HomeCubit>().fetchData();
    Navigator.pushReplacementNamed(context, HomeView.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
