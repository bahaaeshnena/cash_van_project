import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const String inter = 'Nunito'; // English font
  static const String tajawal = 'Tajawal'; // Arabic font

  static String _fontFamily(BuildContext context) {
    if (isArabic()) {
      return tajawal;
    }
    return inter;
  }

  /// نص عادي (Body)
  static TextStyle body(
    BuildContext context, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
  }) {
    final darkMode = isDarkFun(context);

    final Color effectiveColor =
        color ?? (darkMode ? AppColors.darkSubTitleText : AppColors.lightSubTitleText);

    return TextStyle(
      fontFamily: _fontFamily(context),
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: effectiveColor,
      height: height,
    );
  }

  static TextStyle title(
    BuildContext context, {
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w800,
    Color? color,
  }) {
    final darkMode = isDarkFun(context);
    final Color effectiveColor =
        color ?? (darkMode ? AppColors.darkTitleText : AppColors.lightTitleText);

    return TextStyle(
      fontFamily: _fontFamily(context),
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: effectiveColor,
    );
  }

  static TextStyle label(
    BuildContext context, {
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    final darkMode = isDarkFun(context);
    final Color effectiveColor =
        color ?? (darkMode ? AppColors.darkLabelText : AppColors.lightLabelText);

    return TextStyle(
      fontFamily: _fontFamily(context),
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: effectiveColor,
    );
  }
}
