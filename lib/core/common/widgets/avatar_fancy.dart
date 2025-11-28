// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AvatarFancy extends StatelessWidget {
  const AvatarFancy({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkFun(context);
    final hasImage = imageUrl.trim().isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.neonCyan.withOpacity(0.95),
            AppColors.neonBlue.withOpacity(0.95),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 22,
            offset: const Offset(0, 12),
            color: AppColors.neonCyan.withOpacity(isDark ? 0.22 : 0.16),
          ),
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 16),
            color: Colors.black.withOpacity(isDark ? 0.18 : 0.10),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.white.withOpacity(isDark ? 0.12 : 0.16),
        backgroundImage: hasImage ? NetworkImage(imageUrl) : null,
        child: hasImage
            ? null
            : Icon(Icons.person_rounded, size: 50, color: Colors.white.withOpacity(0.95)),
      ),
    );
  }
}
