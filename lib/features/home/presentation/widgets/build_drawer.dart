// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/device_utility.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/features/home/presentation/widgets/build_drawer_item.dart';
import 'package:cach_van/features/home/presentation/widgets/build_section_title.dart';
import 'package:cach_van/features/home/presentation/widgets/button_log_out.dart';
import 'package:cach_van/features/home/presentation/widgets/change_theme_card.dart';
import 'package:cach_van/features/home/presentation/widgets/header_drawer.dart';
import 'package:cach_van/features/home/presentation/widgets/language_bottom_sheet.dart';
import 'package:cach_van/features/profile/presentation/profile_view.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtility.getScreenWidth(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      width: screenWidth * 0.3,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    const Color(0xFF0B1220),
                    const Color(0xFF0B1220).withOpacity(0.92),
                    const Color(0xFF060A12),
                  ]
                : [
                    const Color(0xFFF7FAFF),
                    const Color(0xFFF2F6FF),
                    Colors.white,
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const HeaderDrawer(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    const SizedBox(height: 8),
                    BuildSectionTitle(title: S.of(context).account),
                    BuildDrawerItem(
                      iconPath: Assets.assetsImagesIconsUser,
                      title: S.of(context).profile,
                      subtitle: S.of(context).profileTitle,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, ProfileView.routeName);
                      },
                    ),
                    const SizedBox(height: 12),
                    BuildSectionTitle(title: S.of(context).preferences),
                    BuildDrawerItem(
                      iconPath: Assets.assetsImagesIconsSettingOutline,
                      title: S.of(context).settings,
                      subtitle: S.of(context).settingsTitle,
                      onTap: () => Navigator.pop(context),
                    ),
                    BuildDrawerItem(
                      iconPath: Assets.assetsImagesIconsLanguageSquare,
                      title: S.of(context).changeLanguage,
                      subtitle: S.of(context).changeLanguageTitle,
                      onTap: () async {
                        Navigator.pop(context);
                        await Future.delayed(const Duration(milliseconds: 150));
                        showLanguageBottomSheet(context);
                      },
                    ),
                    const ChangeThemeCard(),
                    const SizedBox(height: 16),
                    Divider(color: (isDark ? Colors.white : Colors.black).withOpacity(0.08)),
                    const SizedBox(height: 16),
                    const ButtonLogOut(),
                    const SizedBox(height: 8),
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
