import 'package:cach_van/core/common/helpers/device_utility.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/features/home/presentation/widgets/summary_tile.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeSummaryTodaySection extends StatelessWidget {
  const HomeSummaryTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    const int visitsToday = 12;
    const int completedVisitsToday = 10;
    const int remainingVisitsToday = 2;
    const int percentageOfCompletedVisits = 80;
    const int invoicesToday = 8;
    const double cashTotalToday = 1540.75;
    const int receiptsToday = 5;
    const int salesReturns = 22;

    final w = DeviceUtility.getScreenWidth(context);
    final summaryH = (w * 0.26).clamp(88.0, 112.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).todaysVisits,
                  value: '$visitsToday',
                  icon: Icons.location_on_rounded,
                  color1: AppColors.neonCyan,
                  color2: AppColors.neonSky,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).completedVisitsToday,
                  value: '$completedVisitsToday',
                  icon: Icons.check_circle_rounded,
                  color1: AppColors.neonGreen,
                  color2: AppColors.neonTeal,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).remainingVisitsToday,
                  value: '$remainingVisitsToday',
                  icon: Icons.pending_actions_rounded,
                  color1: AppColors.neonOrange,
                  color2: AppColors.neonAmber,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).percentageOfCompletedVisits,
                  value: '$percentageOfCompletedVisits%',
                  icon: Icons.pie_chart_rounded,
                  color1: AppColors.neonPurple,
                  color2: AppColors.neonBlue,
                ),
              ),
            ),
          ],
        ),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).todaysBills,
                  value: '$invoicesToday',
                  icon: Icons.receipt_long_rounded,
                  color1: AppColors.neonIndigo,
                  color2: AppColors.neonViolet,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).myCashToday,
                  value: cashTotalToday.toStringAsFixed(2),
                  suffix: 'JOD',
                  icon: Icons.payments_rounded,
                  color1: AppColors.neonLime,
                  color2: AppColors.neonMint,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).receipts,
                  value: '$receiptsToday',
                  icon: Icons.request_quote_rounded,
                  color1: AppColors.neonYellow,
                  color2: AppColors.neonPink,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: summaryH,
                child: SummaryTile(
                  title: S.of(context).saleReturns,
                  value: '$salesReturns',
                  icon: Icons.sell_rounded,
                  color1: AppColors.neonRed,
                  color2: AppColors.neonMagenta,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
