import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogOutSection extends StatelessWidget {
  const LogOutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        Assets.assetsImagesIconsLogout,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
      ),
      title: Text(
        'Logout',
        style: AppTextStyles.body(context).copyWith(
          color: Colors.red.shade400,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
