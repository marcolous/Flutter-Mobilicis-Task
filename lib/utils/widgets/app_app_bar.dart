import 'package:flutter/material.dart';
import 'package:mobilicis_task/view/home/home_view.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, this.firstScreen = false});
  final bool firstScreen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, HomeView.route, (route) => false),
          icon: const Icon(Icons.close),
        ),
      ],
      leading: !firstScreen
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
