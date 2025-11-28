import 'package:cach_van/core/common/helpers/get_user.dart';
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/common/widgets/glass_card.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/features/profile/presentation/widgets/info_tile.dart';
import 'package:cach_van/features/profile/presentation/widgets/section_head.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    final isDark = isDarkFun(context);
    final isAr = isArabicFun();
    final name = (isAr ? user.fullNameAr : user.fullNameEn).toString();
    final email = (user.email).toString();
    final role = (user.role).toString();
    final userNo = (user.userId).toString();
    final username = (user.userName).toString();

    return GlassCard(
      isDark: isDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHead(
            title: S.of(context).accountDetailsTitle,
            subtitle: S.of(context).accountDetailsSubTitle,
            icon: Icons.manage_accounts_rounded,
          ),
          const SizedBox(height: 14),
          InfoTile(
            title: S.of(context).name,
            value: name.isEmpty ? '—' : name,
            icon: Icons.person_outline_rounded,
            accent: AppColors.neonCyan,
          ),
          const SizedBox(height: 10),
          InfoTile(
            title: S.of(context).email,
            value: email.isEmpty ? '—' : email,
            icon: Icons.email_outlined,
            accent: AppColors.neonBlue,
          ),
          const SizedBox(height: 10),
          InfoTile(
            title: S.of(context).userType,
            value: role.isEmpty ? '—' : role,
            icon: Icons.badge_outlined,
            accent: AppColors.neonPurple,
          ),
          const SizedBox(height: 10),
          InfoTile(
            title: S.of(context).userNo,
            value: userNo.isEmpty ? '—' : userNo,
            icon: Icons.verified_user_rounded,
            accent: AppColors.neonSky,
          ),
          const SizedBox(height: 10),
          InfoTile(
            title: S.of(context).username,
            value: username.isEmpty ? '—' : username,
            icon: Icons.alternate_email_rounded,
            accent: AppColors.neonGreen,
          ),
        ],
      ),
    );
  }
}
