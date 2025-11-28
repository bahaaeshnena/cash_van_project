// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/common/widgets/back_ground_linear_gradient.dart';
import 'package:cach_van/core/common/widgets/glowing_ball.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);
    return Stack(
      children: [
        BackGroundLinearGradient(),
        Positioned(
          top: -140,
          right: -120,
          child: IgnorePointer(
            child: GlowingBall(
              width: 280,
              height: 280,
              color1: AppColors.neonBlue.withOpacity(dark ? 0.30 : 0.18),
              color2: AppColors.neonCyan.withOpacity(dark ? 0.12 : 0.08),
              alignmentBegin: Alignment.topLeft,
              alignmentEnd: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -130,
          child: IgnorePointer(
            child: GlowingBall(
              width: 300,
              height: 300,
              color1: AppColors.neonGreen.withOpacity(dark ? 0.16 : 0.10),
              color2: AppColors.neonPurple.withOpacity(dark ? 0.10 : 0.07),
              alignmentBegin: Alignment.topLeft,
              alignmentEnd: Alignment.bottomRight,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
