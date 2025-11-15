import 'package:cach_van/features/auth/presentation/login_view.dart';
import 'package:cach_van/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
      );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('No route defined'),
          ),
        ),
      );
  }
}
