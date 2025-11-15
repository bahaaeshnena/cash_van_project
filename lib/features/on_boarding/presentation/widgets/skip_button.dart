import 'package:cach_van/core/services/shared_prefs.dart';
import 'package:cach_van/core/utils/constants/constants.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/features/auth/presentation/login_view.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            side: const BorderSide(color: AppColors.primaryColor),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginView.routeName);
            Prefs.setBool(kIsOnBoardingView, true);
          },

          label: Text(
            S.of(context).skip,
            style: AppTextStyles.body(
              context,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
