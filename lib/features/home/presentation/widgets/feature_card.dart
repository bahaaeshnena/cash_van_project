// ignore_for_file: deprecated_member_use
import 'package:cach_van/features/home/domain/feature_item_entity.dart';
import 'package:cach_van/features/home/presentation/widgets/summary_mini_bar.dart';
import 'package:flutter/material.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.item,
    required this.dark,
  });

  final FeatureItemEntity item;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final tileFill = dark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.88);
    final tileBorder = dark ? Colors.white.withOpacity(0.14) : Colors.black.withOpacity(0.06);
    final tileShadow = dark ? Colors.black.withOpacity(0.22) : Colors.black.withOpacity(0.10);
    final iconBg = dark ? Colors.white.withOpacity(0.12) : Colors.black.withOpacity(0.04);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: item.onTap,
        child: Container(
          padding: const EdgeInsets.all(1.6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                item.color1.withOpacity(0.95),
                item.color2.withOpacity(0.55),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            decoration: BoxDecoration(
              color: tileFill,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: tileBorder),
              boxShadow: [
                BoxShadow(
                  color: tileShadow,
                  blurRadius: 14,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                        color: iconBg,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: tileBorder),
                      ),
                      child: Icon(
                        item.icon,
                        color: dark ? Colors.white : AppColors.lightTitleText,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    _OpenChip(dark: dark, borderColor: tileBorder),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: dark ? AppColors.darkTitleText : AppColors.lightTitleText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body(
                    context,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: dark
                        ? AppColors.darkSubTitleText.withOpacity(0.90)
                        : AppColors.lightSubTitleText.withOpacity(0.80),
                    height: 1.2,
                  ),
                ),
                const Spacer(),
                const SummaryMiniBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpenChip extends StatelessWidget {
  const _OpenChip({required this.dark, required this.borderColor});

  final bool dark;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
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
            'فتح',
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
