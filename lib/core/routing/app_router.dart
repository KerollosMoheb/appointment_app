import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project_omar_ahmed/core/di/dependency_injection.dart';
import 'package:flutter_complete_project_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_complete_project_omar_ahmed/features/home/ui/home_screen.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/login_screen.dart';
import 'package:flutter_complete_project_omar_ahmed/features/onboarding/onboarding_screen.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (BuildContext context) => getit<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getit<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No Route Found for {$settings.name}')),
          ),
        );
    }
  }
}
