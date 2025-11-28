import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackGround extends StatelessWidget {
  const CustomBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);
    final bgTop = dark ? const Color(0xFF0B1220) : AppColors.lightBackgroundColor;
    final bgBottom = dark ? const Color(0xFF0F1B33) : const Color(0xFFEAF2F5);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [bgTop, bgBottom],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
