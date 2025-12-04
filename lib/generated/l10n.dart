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

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Cash Van`
  String get appBarTitle {
    return Intl.message('Cash Van', name: 'appBarTitle', desc: '', args: []);
  }

  /// `Daily operations overview`
  String get appBarSubtitle {
    return Intl.message(
      'Daily operations overview',
      name: 'appBarSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Personal information`
  String get profileTitle {
    return Intl.message(
      'Personal information',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message('Preferences', name: 'preferences', desc: '', args: []);
  }

  /// `System Settings`
  String get settings {
    return Intl.message(
      'System Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Application configuration`
  String get settingsTitle {
    return Intl.message(
      'Application configuration',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Switch app language`
  String get changeLanguageTitle {
    return Intl.message(
      'Switch app language',
      name: 'changeLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get changeTheme {
    return Intl.message(
      'Change Theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light / Dark mode`
  String get changeThemeTitle {
    return Intl.message(
      'Light / Dark mode',
      name: 'changeThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `User Type`
  String get userType {
    return Intl.message('User Type', name: 'userType', desc: '', args: []);
  }

  /// `Cash Van`
  String get homeViewTitle {
    return Intl.message('Cash Van', name: 'homeViewTitle', desc: '', args: []);
  }

  /// `Ready to get today's work done quickly and with less pressure`
  String get homeViewSubtitle {
    return Intl.message(
      'Ready to get today\'s work done quickly and with less pressure',
      name: 'homeViewSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Today Summary`
  String get todaySummary {
    return Intl.message(
      'Today Summary',
      name: 'todaySummary',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message('Features', name: 'features', desc: '', args: []);
  }

  /// `Today's Visits`
  String get todaysVisits {
    return Intl.message(
      'Today\'s Visits',
      name: 'todaysVisits',
      desc: '',
      args: [],
    );
  }

  /// `Completed Visits Today`
  String get completedVisitsToday {
    return Intl.message(
      'Completed Visits Today',
      name: 'completedVisitsToday',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Visits Today`
  String get remainingVisitsToday {
    return Intl.message(
      'Remaining Visits Today',
      name: 'remainingVisitsToday',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of Completed Visits`
  String get percentageOfCompletedVisits {
    return Intl.message(
      'Percentage of Completed Visits',
      name: 'percentageOfCompletedVisits',
      desc: '',
      args: [],
    );
  }

  /// `Today's Invoices`
  String get todaysBills {
    return Intl.message(
      'Today\'s Invoices',
      name: 'todaysBills',
      desc: '',
      args: [],
    );
  }

  /// `My cash today`
  String get myCashToday {
    return Intl.message(
      'My cash today',
      name: 'myCashToday',
      desc: '',
      args: [],
    );
  }

  /// `Receipts`
  String get receipts {
    return Intl.message('Receipts', name: 'receipts', desc: '', args: []);
  }

  /// `Sales Returns`
  String get saleReturns {
    return Intl.message(
      'Sales Returns',
      name: 'saleReturns',
      desc: '',
      args: [],
    );
  }

  /// `To Open`
  String get toOpen {
    return Intl.message('To Open', name: 'toOpen', desc: '', args: []);
  }

  /// `Account Details`
  String get accountDetailsTitle {
    return Intl.message(
      'Account Details',
      name: 'accountDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your basic user information`
  String get accountDetailsSubTitle {
    return Intl.message(
      'Your basic user information',
      name: 'accountDetailsSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `User No`
  String get userNo {
    return Intl.message('User No', name: 'userNo', desc: '', args: []);
  }

  /// `Quick Overview`
  String get quickOverviewTitle {
    return Intl.message(
      'Quick Overview',
      name: 'quickOverviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cards overview`
  String get quickOverviewSubtitle {
    return Intl.message(
      'Cards overview',
      name: 'quickOverviewSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tip: Tap any value to copy it.`
  String get tapToCopy {
    return Intl.message(
      'Tip: Tap any value to copy it.',
      name: 'tapToCopy',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get Copied {
    return Intl.message('Copied', name: 'Copied', desc: '', args: []);
  }

  /// `Attendance`
  String get attendance {
    return Intl.message('Attendance', name: 'attendance', desc: '', args: []);
  }

  /// `Open / Close Attendance`
  String get attendanceTitle {
    return Intl.message(
      'Open / Close Attendance',
      name: 'attendanceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Procedures`
  String get procedures {
    return Intl.message('Procedures', name: 'procedures', desc: '', args: []);
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `Write a note if you have one...`
  String get notesHint {
    return Intl.message(
      'Write a note if you have one...',
      name: 'notesHint',
      desc: '',
      args: [],
    );
  }

  /// `Start Attendance`
  String get startAttendance {
    return Intl.message(
      'Start Attendance',
      name: 'startAttendance',
      desc: '',
      args: [],
    );
  }

  /// `End Attendance`
  String get endAttendance {
    return Intl.message(
      'End Attendance',
      name: 'endAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Current Location`
  String get currentLocation {
    return Intl.message(
      'Current Location',
      name: 'currentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message('Day', name: 'day', desc: '', args: []);
  }

  /// `Month`
  String get month {
    return Intl.message('Month', name: 'month', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Months`
  String get months {
    return Intl.message('Months', name: 'months', desc: '', args: []);
  }

  /// `Years`
  String get years {
    return Intl.message('Years', name: 'years', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Last 10 Days`
  String get last10Days {
    return Intl.message('Last 10 Days', name: 'last10Days', desc: '', args: []);
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
