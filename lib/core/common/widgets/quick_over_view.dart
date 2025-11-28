// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/get_user.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/common/widgets/glass_card.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/features/profile/presentation/widgets/section_head.dart';
import 'package:cach_van/features/profile/presentation/widgets/state_card.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class QuickOverViwe extends StatelessWidget {
  const QuickOverViwe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    final isDark = isDarkFun(context);

    final role = (user.role).toString();
    final userNo = (user.userId).toString();
    final username = (user.userName).toString();
    return GlassCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHead(
            title: S.of(context).quickOverviewTitle,
            subtitle: S.of(context).quickOverviewSubtitle,
            icon: Icons.grid_view_rounded,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  title: S.of(context).userType,
                  value: role.isEmpty ? '—' : role,
                  icon: Icons.badge_outlined,
                  c1: AppColors.neonPurple,
                  c2: AppColors.neonViolet,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  title: S.of(context).userNo,
                  value: userNo.isEmpty ? '—' : userNo,
                  icon: Icons.verified_user_rounded,
                  c1: AppColors.neonCyan,
                  c2: AppColors.neonSky,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          StatCard(
            title: S.of(context).username,
            value: username.isEmpty ? '—' : username,
            icon: Icons.alternate_email_rounded,
            c1: AppColors.neonGreen,
            c2: AppColors.neonLime,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  AppColors.neonBlue.withOpacity(isDark ? 0.18 : 0.12),
                  AppColors.neonCyan.withOpacity(isDark ? 0.14 : 0.10),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.white.withOpacity(isDark ? 0.10 : 0.06),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.privacy_tip_outlined,
                  color: (isDark ? Colors.white : Colors.black).withOpacity(0.70),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    S.of(context).tapToCopy,
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 13,
                      height: 1.35,
                      color: isDark
                          ? Colors.white.withOpacity(0.70)
                          : Colors.black.withOpacity(0.65),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
