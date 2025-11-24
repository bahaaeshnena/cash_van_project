import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
      child: Text(
        title.toUpperCase(),
        style: AppTextStyles.body(context).copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
