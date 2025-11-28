// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
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

    leadingWidth: 80,
    leading: Builder(
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: isArabicFun() ? 0 : 24,
          right: isArabicFun() ? 24 : 0,
        ),
        child: IconButton(
          iconSize: 34,
          icon: const Icon(Icons.menu_rounded, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
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
            child: const Icon(
              Icons.local_shipping_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).appBarTitle,
                style: AppTextStyles.title(context).copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                S.of(context).appBarSubtitle,
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
          onTap: () {},
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
            child: SvgPicture.asset(
              Assets.assetsImagesIconsNotification,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    ],
  );
}
