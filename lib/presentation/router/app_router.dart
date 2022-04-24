import 'package:flutter/material.dart';
import 'package:web/presentation/screens/dispatchers_screen.dart';
import 'package:web/presentation/screens/drivers_screen.dart';
import 'package:web/presentation/screens/orders_screen.dart';
import 'package:web/presentation/screens/reset_password_screen.dart';
import 'package:web/presentation/screens/login_screen.dart';
import 'package:web/presentation/screens/register_screen.dart';
import 'package:web/presentation/screens/splash_screen.dart';
import 'package:web/presentation/screens/tasks_map_screen.dart';
import 'package:web/presentation/screens/vendors_screen.dart';
import 'package:web/presentation/screens/verify_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/verify':
        return MaterialPageRoute(builder: (_) => VerifyScreen());
      case '/reset':
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case '/orders':
        return MaterialPageRoute(builder: (_) => OrdersScreen());
      case '/tasks':
        return MaterialPageRoute(builder: (_) => const TasksMapScreen());
      case '/drivers':
        return MaterialPageRoute(builder: (_) => DriversScreen());
      case '/dispatchers':
        return MaterialPageRoute(builder: (_) => DispatchersScreen());
      case '/vendors':
        return MaterialPageRoute(builder: (_) => VendorsScreen());
      default:
        return null;
    }
  }
}
