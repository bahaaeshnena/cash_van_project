import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarEntity {
  final String activeImage;
  final String inActiveImage;
  final String Function(BuildContext) label;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.label,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesIconsSetting,
    inActiveImage: Assets.assetsImagesIconsSettingOutline,
    label: (ctx) => S.of(ctx).settings,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesIconsHome,
    inActiveImage: Assets.assetsImagesIconsHomeOutline,
    label: (ctx) => S.of(ctx).home,
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesIconsProfile,
    inActiveImage: Assets.assetsImagesIconsProfileOutline,
    label: (ctx) => S.of(ctx).profile,
  ),
];
