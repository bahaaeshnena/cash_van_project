// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/get_user.dart';
import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/common/widgets/avatar_fancy.dart';
import 'package:flutter/material.dart';

class HeaderProfileView extends StatelessWidget {
  const HeaderProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    final isAr = isArabicFun();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final name = (isAr ? user.fullNameAr : user.fullNameEn).toString();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 4),
        Center(
          child: AvatarFancy(imageUrl: user.avatarUrl ?? ''),
        ),
        const SizedBox(height: 12),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            constraints: const BoxConstraints(maxWidth: 320),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // الخلفية الخفيفة حسب الثيم
              color: isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.03),
              border: Border.all(
                color: isDark ? Colors.white.withOpacity(0.10) : Colors.black.withOpacity(0.06),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                  color: Colors.black.withOpacity(isDark ? 0.25 : 0.08),
                ),
              ],
            ),
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.title(context).copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
