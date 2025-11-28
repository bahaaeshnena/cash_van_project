// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({
    super.key,
    required this.dark,
    required this.neonBlue,
    required this.neonCyan,
  });

  final bool dark;

  final Color neonBlue;
  final Color neonCyan;

  @override
  Widget build(BuildContext context) {
    final glassFill = dark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.78);
    final glassBorder = dark ? Colors.white.withOpacity(0.14) : Colors.black.withOpacity(0.06);
    final shadowColor = dark ? Colors.black.withOpacity(0.28) : Colors.black.withOpacity(0.10);

    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: dark ? 6 : 8, sigmaY: dark ? 6 : 8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: BoxDecoration(
            color: glassFill,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: glassBorder),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 18,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: [
                      neonBlue.withOpacity(0.95),
                      neonCyan.withOpacity(0.85),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.local_shipping_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cash Van',
                      style: AppTextStyles.title(
                        context,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: dark ? Colors.white : AppColors.lightTitleText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'جاهز ننجز شغل اليوم بسرعة وبأقل ضغط 😄',
                      style: AppTextStyles.body(
                        context,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: dark
                            ? Colors.white.withOpacity(0.85)
                            : AppColors.lightSubTitleText.withOpacity(0.85),
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: dark ? Colors.white.withOpacity(0.10) : Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: glassBorder),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      size: 16,
                      color: dark ? Colors.white.withOpacity(0.9) : AppColors.lightLabelText,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'Today',
                      style: AppTextStyles.label(
                        context,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: dark ? Colors.white : AppColors.lightTitleText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
