// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/services/shared_prefs.dart';
import 'package:cach_van/core/utils/constants/constants.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/features/auth/presentation/login_view.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonLogOut extends StatelessWidget {
  const ButtonLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.red.withOpacity(0.14),
        foregroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {
        Prefs.remove(kIsLoggedIn);
        Prefs.remove(kUserData);
        Navigator.of(context).pushNamedAndRemoveUntil(LoginView.routeName, (_) => false);
      },
      icon: SvgPicture.asset(
        Assets.assetsImagesIconsLogout,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
      ),
      label: Text(S.of(context).logout, style: AppTextStyles.body(context, color: Colors.red)),
    );
  }
}
