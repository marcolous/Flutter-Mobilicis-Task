import 'package:mobilicis_task/view/auth/login_view.dart';
import 'package:mobilicis_task/view/auth/verify_otp.dart';
import 'package:mobilicis_task/view/home/home_view.dart';
import 'package:mobilicis_task/view/splash/splash_view.dart';

class AppRoutes {
  static final routes = {
    SplashView.route: (context) => const SplashView(),
    HomeView.route: (context) => const HomeView(),
    LoginView.route: (context) => const LoginView(),
    VerifyOtp.route: (context) => const VerifyOtp(),
  };
}
