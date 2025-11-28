// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/widgets/custom_back_ground.dart';
import 'package:cach_van/core/common/widgets/glowing_ball.dart';
import 'package:cach_van/features/home/domain/feature_item_entity.dart';
import 'package:cach_van/features/home/presentation/widgets/header_home_view.dart';
import 'package:cach_van/features/home/presentation/widgets/home_features_section.dart';
import 'package:cach_van/features/home/presentation/widgets/home_summary_today_section.dart';
import 'package:flutter/material.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);

    return SafeArea(
      child: Stack(
        children: [
          CustomBackGround(),
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

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderHomeView(
                  dark: dark,
                  neonBlue: AppColors.neonBlue,
                  neonCyan: AppColors.neonCyan,
                ),
                const SizedBox(height: 18),
                Text(
                  'ملخص اليوم',
                  style: AppTextStyles.title(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                HomeSummaryTodaySection(),
                const SizedBox(height: 22),
                Text(
                  'الميزات',
                  style: AppTextStyles.title(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                HomeFeaturesSection(
                  items: features,
                  dark: dark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
