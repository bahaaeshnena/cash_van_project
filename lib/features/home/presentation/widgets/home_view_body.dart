import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy numbers
    const int visitsToday = 12;
    const int invoicesToday = 8;
    const double cashTotalToday = 1540.75;
    const int receiptsToday = 5;

    final dark = isDarkFun(context);
    final w = MediaQuery.of(context).size.width;
    final summaryH = (w * 0.26).clamp(88.0, 112.0);

    final bgTop = dark ? const Color(0xFF0B1220) : AppColors.lightBackgroundColor;
    final bgBottom = dark ? const Color(0xFF0F1B33) : const Color(0xFFEAF2F5);

    final glassFill = dark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.78);
    final glassBorder = dark ? Colors.white.withOpacity(0.14) : Colors.black.withOpacity(0.06);
    final shadowColor = dark ? Colors.black.withOpacity(0.28) : Colors.black.withOpacity(0.10);

    // ✅ ألوان الـ cards زي “أول مرة”
    const neonGreen = Color(0xFF22C55E);
    const neonCyan = Color(0xFF06B6D4);
    const neonPurple = Color(0xFF8B5CF6);
    const neonBlue = Color(0xFF3B82F6);
    const neonOrange = Color(0xFFF97316);
    const neonRed = Color(0xFFEF4444);
    const neonSky = Color(0xFF0EA5E9);

    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [bgTop, bgBottom],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Glows
          Positioned(
            top: -140,
            right: -120,
            child: IgnorePointer(
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      neonBlue.withOpacity(dark ? 0.30 : 0.18),
                      neonCyan.withOpacity(dark ? 0.12 : 0.08),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -130,
            child: IgnorePointer(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      neonGreen.withOpacity(dark ? 0.16 : 0.10),
                      neonPurple.withOpacity(dark ? 0.10 : 0.07),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HERO (blur واحد فقط)
                ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: dark ? 6 : 8, sigmaY: dark ? 6 : 8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                        color: glassFill,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: glassBorder),
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 18,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: LinearGradient(
                                colors: [
                                  neonBlue.withOpacity(0.95),
                                  neonCyan.withOpacity(0.85),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Icon(
                              Icons.local_shipping_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash Van',
                                  style: AppTextStyles.title(
                                    context,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: dark ? Colors.white : AppColors.lightTitleText,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'جاهز ننجز شغل اليوم بسرعة وبأقل ضغط 😄',
                                  style: AppTextStyles.body(
                                    context,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: dark
                                        ? Colors.white.withOpacity(0.85)
                                        : AppColors.lightSubTitleText.withOpacity(0.85),
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: dark
                                  ? Colors.white.withOpacity(0.10)
                                  : Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: glassBorder),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  size: 16,
                                  color: dark
                                      ? Colors.white.withOpacity(0.9)
                                      : AppColors.lightLabelText,
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  'Today',
                                  style: AppTextStyles.label(
                                    context,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: dark ? Colors.white : AppColors.lightTitleText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                Text(
                  'ملخص اليوم',
                  style: AppTextStyles.title(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: dark ? AppColors.darkTitleText : AppColors.lightTitleText,
                  ),
                ),
                const SizedBox(height: 10),

                // Summary Tiles (neon colors رجعت 😄)
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: summaryH,
                        child: _SummaryTile(
                          title: 'زيارات اليوم',
                          value: '$visitsToday',
                          icon: Icons.location_on_rounded,
                          c1: neonGreen,
                          c2: neonCyan,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: summaryH,
                        child: _SummaryTile(
                          title: 'فواتير اليوم',
                          value: '$invoicesToday',
                          icon: Icons.receipt_long_rounded,
                          c1: neonPurple,
                          c2: neonBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: summaryH,
                        child: _SummaryTile(
                          title: 'نقدي اليوم',
                          value: cashTotalToday.toStringAsFixed(2),
                          suffix: 'JOD',
                          icon: Icons.payments_rounded,
                          c1: neonOrange,
                          c2: neonRed,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: summaryH,
                        child: _SummaryTile(
                          title: 'سندات القبض',
                          value: '$receiptsToday',
                          icon: Icons.request_quote_rounded,
                          c1: neonCyan,
                          c2: neonBlue,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                Text(
                  'الميزات',
                  style: AppTextStyles.title(
                    context,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: dark ? AppColors.darkTitleText : AppColors.lightTitleText,
                  ),
                ),
                const SizedBox(height: 10),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 520;
                    final cross = isWide ? 3 : 2;
                    final tileHeight = isWide ? 150.0 : 142.0;

                    final items = <Map<String, dynamic>>[
                      {
                        't': 'الفواتير',
                        's': 'إنشاء / عرض',
                        'i': Icons.receipt_long_rounded,
                        'c1': neonBlue,
                        'c2': neonCyan,
                      },
                      {
                        't': 'سند القبض',
                        's': 'كاش + شيكات',
                        'i': Icons.request_quote_rounded,
                        'c1': neonCyan,
                        'c2': neonBlue,
                      },
                      {
                        't': 'المرتجعات',
                        's': 'مرتجع مبيعات',
                        'i': Icons.assignment_return_rounded,
                        'c1': neonPurple,
                        'c2': neonBlue,
                      },
                      {
                        't': 'المواد',
                        's': 'بحث / تفاصيل',
                        'i': Icons.inventory_2_rounded,
                        'c1': neonGreen,
                        'c2': neonCyan,
                      },
                      {
                        't': 'الكميات المتوفرة',
                        's': 'مخزون المستودع',
                        'i': Icons.warehouse_rounded,
                        'c1': neonOrange,
                        'c2': neonRed,
                      },
                      {
                        't': 'الزيارات',
                        's': 'خارج الخطة / الخطة',
                        'i': Icons.map_rounded,
                        'c1': neonSky,
                        'c2': neonGreen,
                      },
                    ];

                    final tileFill = dark
                        ? Colors.white.withOpacity(0.08)
                        : Colors.white.withOpacity(0.88);
                    final tileBorder = dark
                        ? Colors.white.withOpacity(0.14)
                        : Colors.black.withOpacity(0.06);
                    final tileShadow = dark
                        ? Colors.black.withOpacity(0.22)
                        : Colors.black.withOpacity(0.10);
                    final iconBg = dark
                        ? Colors.white.withOpacity(0.12)
                        : Colors.black.withOpacity(0.04);

                    return GridView.count(
                      crossAxisCount: cross,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: (constraints.maxWidth / cross) / tileHeight,
                      children: items.map((x) {
                        final String title = x['t'];
                        final String sub = x['s'];
                        final IconData icon = x['i'];
                        final Color c1 = x['c1'];
                        final Color c2 = x['c2'];

                        return Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(1.6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                  colors: [c1.withOpacity(0.95), c2.withOpacity(0.55)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                                decoration: BoxDecoration(
                                  color: tileFill,
                                  borderRadius: BorderRadius.circular(22),
                                  border: Border.all(color: tileBorder),
                                  boxShadow: [
                                    BoxShadow(
                                      color: tileShadow,
                                      blurRadius: 14,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 46,
                                          width: 46,
                                          decoration: BoxDecoration(
                                            color: iconBg,
                                            borderRadius: BorderRadius.circular(18),
                                            border: Border.all(color: tileBorder),
                                          ),
                                          child: Icon(
                                            icon,
                                            color: dark ? Colors.white : AppColors.lightTitleText,
                                            size: 24,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            color: dark
                                                ? Colors.white.withOpacity(0.10)
                                                : Colors.black.withOpacity(0.05),
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(color: tileBorder),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'فتح',
                                                style: AppTextStyles.label(
                                                  context,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w900,
                                                  color: dark
                                                      ? Colors.white
                                                      : AppColors.lightTitleText,
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Icon(
                                                Icons.arrow_forward_rounded,
                                                size: 18,
                                                color: dark
                                                    ? Colors.white.withOpacity(0.95)
                                                    : AppColors.lightTitleText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.title(
                                        context,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: dark
                                            ? AppColors.darkTitleText
                                            : AppColors.lightTitleText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      sub,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.body(
                                        context,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: dark
                                            ? AppColors.darkSubTitleText.withOpacity(0.90)
                                            : AppColors.lightSubTitleText.withOpacity(0.80),
                                        height: 1.2,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 5,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: dark
                                            ? Colors.white.withOpacity(0.10)
                                            : Colors.black.withOpacity(0.06),
                                        borderRadius: BorderRadius.circular(99),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          height: 5,
                                          width: 46,
                                          decoration: BoxDecoration(
                                            color: dark
                                                ? Colors.white.withOpacity(0.55)
                                                : Colors.black.withOpacity(0.22),
                                            borderRadius: BorderRadius.circular(99),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({
    required this.title,
    required this.value,
    required this.icon,
    required this.c1,
    required this.c2,
    this.suffix,
  });

  final String title;
  final String value;
  final String? suffix;
  final IconData icon;
  final Color c1;
  final Color c2;

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);

    final fill = dark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.88);
    final border = dark ? Colors.white.withOpacity(0.14) : Colors.black.withOpacity(0.06);
    final iconBg = dark ? Colors.white.withOpacity(0.12) : Colors.black.withOpacity(0.04);

    return Container(
      padding: const EdgeInsets.all(1.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [c1.withOpacity(0.95), c2.withOpacity(0.55)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: border),
              ),
              child: Icon(icon, color: dark ? Colors.white : AppColors.lightTitleText, size: 22),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.label(
                      context,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: dark
                          ? AppColors.darkLabelText.withOpacity(0.95)
                          : AppColors.lightLabelText.withOpacity(0.95),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.title(
                            context,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: dark ? AppColors.darkTitleText : AppColors.lightTitleText,
                          ),
                        ),
                      ),
                      if (suffix != null) ...[
                        const SizedBox(width: 6),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            suffix!,
                            style: AppTextStyles.label(
                              context,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: dark
                                  ? AppColors.darkLabelText.withOpacity(0.90)
                                  : AppColors.lightLabelText.withOpacity(0.90),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
