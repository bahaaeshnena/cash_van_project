// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkFun(context);
    final List<Color> gradientColors = [
      AppColors.primaryColor,
      Color.lerp(AppColors.primaryColor, AppColors.neonBlue, 0.35)!,
      AppColors.neonCyan.withOpacity(isDark ? 0.70 : 0.55),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 16,
      width: isActive ? 40 : 16,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: isActive ? LinearGradient(colors: gradientColors) : null,
        // color: isActive ? AppColors.primaryColor : Colors.transparent,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
