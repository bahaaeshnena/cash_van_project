// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class PillWidget extends StatelessWidget {
  final String text;
  final bool ok;
  const PillWidget({super.key, required this.text, required this.ok});

  @override
  Widget build(BuildContext context) {
    final bg = ok ? AppColors.neonGreen.withOpacity(0.12) : AppColors.neonOrange.withOpacity(0.12);
    final br = ok ? AppColors.neonGreen.withOpacity(0.30) : AppColors.neonOrange.withOpacity(0.30);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: bg,
        border: Border.all(color: br),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.label(context).copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
