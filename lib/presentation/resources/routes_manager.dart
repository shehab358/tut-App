import 'package:flutter/material.dart';
import 'package:tut_app/presentation/details/details_screen.dart';
import 'package:tut_app/presentation/forgetpassword/forget_password_screen.dart';
import 'package:tut_app/presentation/login/login_screen.dart';
import 'package:tut_app/presentation/main/main_screen.dart';
import 'package:tut_app/presentation/onboarding/onboarding_screen.dart';
import 'package:tut_app/presentation/register/register_screen.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String onBoarding = "/onBoarding";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringsManager.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            StringsManager.noRouteFound,
          ),
        ),
      ),
    );
  }
}
