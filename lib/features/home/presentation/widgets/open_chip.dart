// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class OpenChip extends StatelessWidget {
  const OpenChip({super.key, required this.borderColor});

  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: dark ? Colors.white.withOpacity(0.10) : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).toOpen,
            style: AppTextStyles.label(
              context,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              color: dark ? Colors.white : AppColors.lightTitleText,
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            Icons.arrow_forward_rounded,
            size: 18,
            color: dark ? Colors.white.withOpacity(0.95) : AppColors.lightTitleText,
          ),
        ],
      ),
    );
  }
}
