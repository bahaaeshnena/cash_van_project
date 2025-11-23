import 'package:cach_van/core/services/service_locator.dart';
import 'package:cach_van/core/services/shared_prefs.dart';
import 'package:cach_van/core/utils/constants/constants.dart';
import 'package:cach_van/core/utils/constants/ui/app_theme.dart';
import 'package:cach_van/core/common/helpers/on_generate_routes.dart';
import 'package:cach_van/features/auth/presentation/login_view.dart';
import 'package:cach_van/features/home/presentation/home_view.dart';
import 'package:cach_van/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: Prefs.getBool(kIsOnBoardingView) == true
          ? (Prefs.getBool(kIsLoggedIn) == true ? HomeView.routeName : LoginView.routeName)
          : OnBoardingView.routeName,
    );
  }
}
