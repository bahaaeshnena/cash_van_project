// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:cach_van/core/common/helpers/get_user.dart';
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    final userName = isArabicFun() ? user.fullNameAr : user.fullNameEn;
    final userEmail = user.email;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final c1 = AppColors.primaryColor;
    final c2 = Color.lerp(AppColors.primaryColor, AppColors.neonBlue, 0.35)!;
    final c3 = AppColors.neonCyan.withOpacity(isDark ? 0.55 : 0.45);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [c1.withOpacity(0.98), c2.withOpacity(0.92), c3],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neonCyan.withOpacity(isDark ? 0.18 : 0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.22 : 0.10),
                  blurRadius: 26,
                  offset: const Offset(0, 14),
                ),
              ],
              border: Border.all(
                color: Colors.white.withOpacity(isDark ? 0.14 : 0.18),
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 66,
                      width: 66,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(isDark ? 0.10 : 0.12),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(isDark ? 0.16 : 0.18),
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white.withOpacity(isDark ? 0.14 : 0.16),
                        child: const Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 18),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.title(context).copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          _Pill(
                            icon: const Icon(Icons.badge_outlined, size: 14, color: Colors.white),
                            label1: '${S.of(context).userType}:',
                            label2: getUser().role,
                          ),
                          _Pill(
                            icon: SvgPicture.asset(
                              Assets.assetsImagesIconsEmail,
                              width: 14,
                              height: 14,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                            label1: '${S.of(context).email}:',
                            label2: userEmail,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.icon,
    required this.label1,
    required this.label2,
  });

  final Widget icon;
  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(isDark ? 0.16 : 0.18),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(isDark ? 0.14 : 0.16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 6),
          Text(
            label1,
            style: AppTextStyles.body(context).copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 11,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label2,
            style: AppTextStyles.body(context).copyWith(
              color: Colors.white.withOpacity(0.95),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
