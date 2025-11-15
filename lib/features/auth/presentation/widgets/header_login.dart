import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).loginWelcomeBack,
          style: AppTextStyles.title(context).copyWith(
            fontSize: 40,
          ),
        ),
        Text(
          S.of(context).loginPleaseLogin,
          style: AppTextStyles.label(context).copyWith(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
