// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class BuildChipInfo extends StatelessWidget {
  const BuildChipInfo({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.body(context).copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
