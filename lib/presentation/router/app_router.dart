import 'package:flutter/material.dart';
import 'package:web/presentation/screens/login.dart';
import 'package:web/presentation/screens/splash_screen.dart';
import 'package:web/presentation/screens/verify.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/verify':
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      default:
        return null;
    }
  }
}
