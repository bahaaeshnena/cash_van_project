import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildDrawerItem extends StatelessWidget {
  const BuildDrawerItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: SvgPicture.asset(iconPath, width: 24, height: 24),
        title: Text(
          title,
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: AppTextStyles.body(context).copyWith(
                  color: Colors.grey.shade600,
                ),
              )
            : null,
        onTap: onTap,
        horizontalTitleGap: 12,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 4,
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          size: 22,
        ),
      ),
    );
  }
}
