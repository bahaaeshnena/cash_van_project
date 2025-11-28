import 'package:cach_van/features/auth/presentation/login_view.dart';
import 'package:cach_van/features/home/presentation/home_view.dart';
import 'package:cach_van/features/home/presentation/main_view.dart';
import 'package:cach_van/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:cach_van/features/profile/presentation/profile_view.dart';
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
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
      );
    case MainView.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainView(),
      );
    case ProfileView.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileView(),
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
