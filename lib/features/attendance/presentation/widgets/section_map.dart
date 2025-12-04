// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/widgets/custom_google_map.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/features/attendance/presentation/widgets/card_shell.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionMap extends StatelessWidget {
  const SectionMap({
    super.key,
    required this.panelHeight,
  });

  final double panelHeight;

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).currentLocation,
                  style: AppTextStyles.title(
                    context,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: AppColors.neonCyan.withOpacity(0.12),
                  border: Border.all(
                    color: AppColors.neonCyan.withOpacity(0.25),
                  ),
                ),
                child: Text(
                  "GPS",
                  style: AppTextStyles.label(context).copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: panelHeight,
              child: const CustomGoogleMap(),
            ),
          ),
        ],
      ),
    );
  }
}
