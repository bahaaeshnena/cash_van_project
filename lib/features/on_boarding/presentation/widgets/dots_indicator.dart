import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 16,
      width: isActive ? 40 : 16,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.transparent,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
