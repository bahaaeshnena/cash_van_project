// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/core/utils/helpers/is_arabic.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionDescriptionLogin extends StatelessWidget {
  const SectionDescriptionLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 30,
        left: 50,
      ),
      child: Directionality(
        textDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Text(
                  S.of(context).loginTitleLogin,
                  style: AppTextStyles.title(context).copyWith(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).loginDescriptionLogin,
                  style: AppTextStyles.label(context).copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  Assets.assetsImagesLoginImage,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
