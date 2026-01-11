import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/login_screen.dart';
import 'package:flutter_complete_project_omar_ahmed/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
