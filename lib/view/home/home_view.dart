import 'package:flutter/material.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';

class HomeView extends StatelessWidget {
  static const route = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(),
    );
  }
}
