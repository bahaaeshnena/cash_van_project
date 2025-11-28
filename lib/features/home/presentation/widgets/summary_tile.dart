// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/features/home/presentation/widgets/summary_mini_bar.dart';
import 'package:flutter/material.dart';

class SummaryTile extends StatelessWidget {
  const SummaryTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color1,
    required this.color2,
    this.suffix,
    this.onTap, // اختياري (ما بكسر الاستدعاءات الحالية)
  });

  final String title;
  final String value;
  final String? suffix;
  final IconData icon;
  final Color color1;
  final Color color2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);

    final border = dark ? Colors.white.withOpacity(0.16) : Colors.black.withOpacity(0.08);

    final surface = dark
        ? const Color(0xFF0F1B33).withOpacity(0.55)
        : Colors.white.withOpacity(0.82);
    final surface2 = dark ? Colors.white.withOpacity(0.06) : Colors.white.withOpacity(0.92);

    final labelColor = dark
        ? AppColors.darkLabelText.withOpacity(0.92)
        : AppColors.lightLabelText.withOpacity(0.92);

    final titleColor = dark ? AppColors.darkTitleText : AppColors.lightTitleText;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                color1.withOpacity(dark ? 0.60 : 0.92),
                color2.withOpacity(dark ? 0.28 : 0.56),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              // غلو ملون خفيف
              BoxShadow(
                color: color1.withOpacity(dark ? 0.18 : 0.14),
                blurRadius: 22,
                offset: const Offset(0, 12),
              ),
              // ظل طبيعي
              BoxShadow(
                color: Colors.black.withOpacity(dark ? 0.24 : 0.10),
                blurRadius: 18,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: border),
                  gradient: LinearGradient(
                    colors: [surface, surface2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // لمعة خفيفة أعلى اليسار
                    Positioned(
                      top: -22,
                      left: -18,
                      child: Container(
                        width: 110,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(dark ? 0.10 : 0.22),
                              Colors.transparent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Row(
                        children: [
                          _IconBubble(
                            icon: icon,
                            dark: dark,
                            border: border,
                            color1: color1,
                            color2: color2,
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
                                    fontWeight: FontWeight.w900,
                                    color: labelColor,
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: titleColor,
                                        ),
                                      ),
                                    ),
                                    if (suffix != null) ...[
                                      const SizedBox(width: 6),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 3),
                                        child: Text(
                                          suffix!,
                                          style: AppTextStyles.label(
                                            context,
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w900,
                                            color: labelColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 8),
                                const SummaryMiniBar(),
                              ],
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
        ),
      ),
    );
  }
}

class _IconBubble extends StatelessWidget {
  const _IconBubble({
    required this.icon,
    required this.dark,
    required this.border,
    required this.color1,
    required this.color2,
  });

  final IconData icon;
  final bool dark;
  final Color border;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final fg = dark ? Colors.white : AppColors.lightTitleText;

    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        gradient: LinearGradient(
          colors: [
            color1.withOpacity(dark ? 0.22 : 0.16),
            color2.withOpacity(dark ? 0.10 : 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 7,
            left: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dark
                    ? Colors.white.withOpacity(0.18)
                    : const Color(0xFFFFFFFF).withOpacity(0.65),
              ),
            ),
          ),
          Center(
            child: Icon(icon, color: fg, size: 22),
          ),
        ],
      ),
    );
  }
}
