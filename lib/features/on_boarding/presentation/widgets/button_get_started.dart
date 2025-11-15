// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.25),
            Colors.transparent,
          ],
          radius: 0.9,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 8,
          shadowColor: AppColors.primaryColor.withOpacity(0.5),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          backgroundColor: AppColors.primaryColor,
        ),
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const SizedBox(
            width: 68,
            height: 68,
            child: Center(
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
