import 'package:cach_van/core/common/widgets/custom_back_ground.dart';
import 'package:cach_van/features/home/domain/feature_item_entity.dart';
import 'package:cach_van/features/home/presentation/widgets/header_home_view.dart';
import 'package:cach_van/features/home/presentation/widgets/home_features_section.dart';
import 'package:cach_van/features/home/presentation/widgets/home_summary_today_section.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomBackGround(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderHomeView(
                color1: AppColors.neonBlue,
                color2: AppColors.neonCyan,
              ),
              const SizedBox(height: 18),
              Text(
                S.of(context).todaySummary,
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
                S.of(context).features,
                style: AppTextStyles.title(
                  context,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10),
              HomeFeaturesSection(
                items: features,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
