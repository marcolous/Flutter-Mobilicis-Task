import 'package:mobilicis_task/view/home/home_view.dart';
import 'package:mobilicis_task/view/splash/splash_view.dart';

class AppRoutes {
  static final routes = {
    SplashView.route: (context) => const SplashView(),
    HomeView.route: (context) => const HomeView(),
  };
}
