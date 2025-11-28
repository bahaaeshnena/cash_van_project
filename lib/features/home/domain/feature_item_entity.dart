import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class FeatureItemEntity {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color1;
  final Color color2;
  final VoidCallback? onTap;

  const FeatureItemEntity({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color1,
    required this.color2,
    this.onTap,
  });
}

List<FeatureItemEntity> get features => [
  FeatureItemEntity(
    title: 'الفواتير',
    subtitle: 'إنشاء / عرض',
    icon: Icons.receipt_long_rounded,
    color1: AppColors.neonBlue,
    color2: AppColors.neonCyan,
    onTap: () {},
  ),
  FeatureItemEntity(
    title: 'سند القبض',
    subtitle: 'كاش + شيكات',
    icon: Icons.request_quote_rounded,
    color1: AppColors.neonCyan,
    color2: AppColors.neonBlue,
    onTap: () {},
  ),
  FeatureItemEntity(
    title: 'المرتجعات',
    subtitle: 'مرتجع مبيعات',
    icon: Icons.assignment_return_rounded,
    color1: AppColors.neonPurple,
    color2: AppColors.neonBlue,
    onTap: () {},
  ),
  FeatureItemEntity(
    title: 'المواد',
    subtitle: 'بحث / تفاصيل',
    icon: Icons.inventory_2_rounded,
    color1: AppColors.neonGreen,
    color2: AppColors.neonCyan,
    onTap: () {},
  ),
  FeatureItemEntity(
    title: 'الكميات المتوفرة',
    subtitle: 'مخزون المستودع',
    icon: Icons.warehouse_rounded,
    color1: AppColors.neonOrange,
    color2: AppColors.neonRed,
    onTap: () {},
  ),
  FeatureItemEntity(
    title: 'الزيارات',
    subtitle: 'خارج الخطة / الخطة',
    icon: Icons.map_rounded,
    color1: AppColors.neonSky,
    color2: AppColors.neonGreen,
    onTap: () {},
  ),
];
