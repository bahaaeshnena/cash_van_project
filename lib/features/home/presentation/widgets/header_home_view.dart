// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({
    super.key,
    required this.color1,
    required this.color2,
  });

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);
    final glassFill = dark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.78);
    final glassBorder = dark ? Colors.white.withOpacity(0.14) : Colors.black.withOpacity(0.06);
    final shadowColor = dark ? Colors.black.withOpacity(0.28) : Colors.black.withOpacity(0.10);

    return ClipRRect(
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
                      color1.withOpacity(0.95),
                      color2.withOpacity(0.85),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    Assets.assetsImagesIconsHome,
                    color: Colors.white,
                    height: 15,
                    width: 15,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).home,
                      style: AppTextStyles.title(
                        context,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: dark ? Colors.white : AppColors.lightTitleText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      S.of(context).homeViewSubtitle,
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
                  color: dark ? Colors.white.withOpacity(0.10) : Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: glassBorder),
                ),
                child: Row(
                  children: [
                    Text(
                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
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
    );
  }
}
