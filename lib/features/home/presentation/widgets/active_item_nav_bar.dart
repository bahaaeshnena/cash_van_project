// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/helpers/is_arabic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveItemNavBar extends StatelessWidget {
  const ActiveItemNavBar({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.8),
          ],
          stops: const [0.0, 1.0],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,

        children: [
          Padding(
            padding: isArabic() ? EdgeInsets.only(top: 10) : EdgeInsets.all(5),
            child: Text(
              name,
              textAlign: TextAlign.end,
              style: AppTextStyles.body(context).copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            image,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
