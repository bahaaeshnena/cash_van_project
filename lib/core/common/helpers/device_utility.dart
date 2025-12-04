import 'dart:io';
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:flutter/material.dart';

class DeviceUtility {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static String fmtDate(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.day)}/${two(d.month)}/${d.year}";
  }

  static String arabicDayName(int weekday) {
    final isArabic = isArabicFun();
    switch (weekday) {
      case 1:
        return isArabic ? "الأحد" : "Sunday";
      case 2:
        return isArabic ? "الاثنين" : "Monday";
      case 3:
        return isArabic ? "الثلاثاء" : "Tuesday";
      case 4:
        return isArabic ? "الاربعاء" : "Wednesday";
      case 5:
        return isArabic ? "الخميس" : "Thursday";
      case 6:
        return isArabic ? "الجمعة" : "Friday";
      case 7:
        return isArabic ? "السبت" : "Saturday";
      default:
        return "";
    }
  }
}
