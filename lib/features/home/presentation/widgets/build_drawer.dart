// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/device_utility.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/features/home/presentation/widgets/build_drawer_item.dart';
import 'package:cach_van/features/home/presentation/widgets/build_section_title.dart';
import 'package:cach_van/features/home/presentation/widgets/change_theme_card.dart';
import 'package:cach_van/features/home/presentation/widgets/header_drawer.dart';
import 'package:cach_van/features/home/presentation/widgets/log_out_section.dart';
import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtility.getScreenWidth(context);

    return Drawer(
      width: screenWidth * 0.3,
      child: SafeArea(
        child: Column(
          children: [
            HeaderDrawer(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  const SizedBox(height: 8),
                  const BuildSectionTitle(title: 'Account'),
                  BuildDrawerItem(
                    iconPath: Assets.assetsImagesIconsUser,
                    title: 'Profile',
                    subtitle: 'Personal information',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 12),
                  const BuildSectionTitle(title: 'Preferences'),
                  BuildDrawerItem(
                    iconPath: Assets.assetsImagesIconsSettingOutline,
                    title: 'System Settings',
                    subtitle: 'Application configuration',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  BuildDrawerItem(
                    iconPath: Assets.assetsImagesIconsLanguageSquare,
                    title: 'Change Language',
                    subtitle: 'Switch app language',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ChangeThemeCard(),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  LogOutSection(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
