// ignore_for_file: library_private_types_in_public_api

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode themeMode;
  late Locale _locale;

  Locale get locale => _locale;

  @override
  void initState() {
    super.initState();

    final isDark = Prefs.getBool(kIsDarkMode);
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    final code = (Prefs.getString(kAppLanguageCode));
    _locale = Locale(code.isEmpty ? 'en' : code);
  }

  void changeTheme(bool isDark) {
    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
    Prefs.setBool(kIsDarkMode, isDark);
  }

  void changeLanguage(String code) {
    setState(() => _locale = Locale(code));
    Prefs.setString(kAppLanguageCode, code);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: Prefs.getBool(kIsOnBoardingView) == true
          ? (Prefs.getBool(kIsLoggedIn) == true ? HomeView.routeName : LoginView.routeName)
          : OnBoardingView.routeName,
    );
  }
}
