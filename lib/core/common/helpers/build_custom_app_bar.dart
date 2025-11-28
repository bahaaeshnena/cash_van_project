// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget buildCustomAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
  IconData? iconMaterial,
  String? iconSvg,
}) {
  final isDark = isDarkFun(context);

  // Home-ish neon blend (calm)
  final c1 = AppColors.primaryColor;
  final c2 = Color.lerp(AppColors.primaryColor, AppColors.neonBlue, 0.35)!;
  final c3 = AppColors.neonCyan.withOpacity(isDark ? 0.55 : 0.45);

  return AppBar(
    elevation: 0,
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [c1, c2, c3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            offset: const Offset(0, 8),
            color: AppColors.neonCyan.withOpacity(isDark ? 0.16 : 0.12),
          ),
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 14),
            color: Colors.black.withOpacity(isDark ? 0.22 : 0.10),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(isDark ? 0.10 : 0.14),
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ),

    titleSpacing: 0,
    title: Padding(
      padding: EdgeInsets.only(
        left: isArabicFun() ? 0 : 24,
        right: isArabicFun() ? 24 : 0,
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(isDark ? 0.12 : 0.14),
              border: Border.all(
                color: Colors.white.withOpacity(isDark ? 0.16 : 0.18),
              ),
            ),
            child: iconSvg != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      iconSvg,
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                  )
                : Icon(
                    iconMaterial,
                    color: Colors.white,
                    size: 24,
                  ),
          ),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.title(context).copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.body(context).copyWith(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ),

    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(isDark ? 0.12 : 0.14),
              border: Border.all(
                color: Colors.white.withOpacity(isDark ? 0.16 : 0.18),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                  color: AppColors.neonBlue.withOpacity(isDark ? 0.10 : 0.08),
                ),
              ],
            ),
            child: Icon(
              isArabicFun() ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
    ],
  );
}
