// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Don't waste time browsing through papers.`
  String get loginTitleLogin {
    return Intl.message(
      'Don\'t waste time browsing through papers.',
      name: 'loginTitleLogin',
      desc: '',
      args: [],
    );
  }

  /// `All your clients, prices, offers, and discounts are right there on one clear and organized screen.`
  String get loginDescriptionLogin {
    return Intl.message(
      'All your clients, prices, offers, and discounts are right there on one clear and organized screen.',
      name: 'loginDescriptionLogin',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get loginWelcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'loginWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Please login to your account`
  String get loginPleaseLogin {
    return Intl.message(
      'Please login to your account',
      name: 'loginPleaseLogin',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get isRequired {
    return Intl.message('is required', name: 'isRequired', desc: '', args: []);
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Your entire tour in one screen`
  String get onBoardingTitle1 {
    return Intl.message(
      'Your entire tour in one screen',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Organize your visits, see incoming customers, and track your collections step by step without paper or clutter.`
  String get onBoardingSubtitle1 {
    return Intl.message(
      'Organize your visits, see incoming customers, and track your collections step by step without paper or clutter.',
      name: 'onBoardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Distribute, invoice, and complete your work in seconds.`
  String get onBoardingTitle2 {
    return Intl.message(
      'Distribute, invoice, and complete your work in seconds.',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Choose the customer, add the materials, and get the invoice ready with prices, discounts, and inventory from the same app.`
  String get onBoardingSubtitle2 {
    return Intl.message(
      'Choose the customer, add the materials, and get the invoice ready with prices, discounts, and inventory from the same app.',
      name: 'onBoardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `End of the day… clear numbers`
  String get onBoardingTitle3 {
    return Intl.message(
      'End of the day… clear numbers',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `See your total sales, returns, and remaining vehicle inventory in a simple report that keeps you always in the loop.`
  String get onBoardingSubtitle3 {
    return Intl.message(
      'See your total sales, returns, and remaining vehicle inventory in a simple report that keeps you always in the loop.',
      name: 'onBoardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
