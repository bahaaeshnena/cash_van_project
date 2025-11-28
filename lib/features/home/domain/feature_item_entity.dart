import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:flutter/material.dart';

class FeatureItemEntity {
  final String titleAr;
  final String subtitleAr;
  final String titleEn;
  final String subtitleEn;
  final IconData icon;
  final Color color1;
  final Color color2;
  final VoidCallback? onTap;

  const FeatureItemEntity({
    required this.titleAr,
    required this.subtitleAr,
    required this.titleEn,
    required this.subtitleEn,
    required this.icon,
    required this.color1,
    required this.color2,
    this.onTap,
  });
}

List<FeatureItemEntity> get features => [
  FeatureItemEntity(
    titleAr: 'الدوام',
    subtitleAr: "فتح / اغلاق الدوام",
    titleEn: 'Attendance',
    subtitleEn: "Open / Close Attendance",
    icon: Icons.work_rounded,
    color1: AppColors.neonMint,
    color2: AppColors.neonTeal,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'الفواتير',
    subtitleAr: 'إنشاء / عرض',
    titleEn: 'Invoices',
    subtitleEn: 'Create / View',
    icon: Icons.receipt_long_rounded,
    color1: AppColors.neonBlue,
    color2: AppColors.neonIndigo,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'سند القبض',
    subtitleAr: 'كاش + شيكات',
    titleEn: 'Receipt',
    subtitleEn: 'Cash + Checks',
    icon: Icons.request_quote_rounded,
    color1: AppColors.neonAmber,
    color2: AppColors.neonOrange,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'المرتجعات',
    subtitleAr: 'مرتجع مبيعات',
    titleEn: 'Returns',
    subtitleEn: 'Sales Returns',
    icon: Icons.assignment_return_rounded,
    color1: AppColors.neonPurple,
    color2: AppColors.neonViolet,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'المواد',
    subtitleAr: 'بحث / تفاصيل',
    titleEn: 'Items',
    subtitleEn: 'Search / Details',
    icon: Icons.inventory_2_rounded,
    color1: AppColors.neonGreen,
    color2: AppColors.neonLime,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'الكميات المتوفرة',
    subtitleAr: 'مخزون المستودع',
    titleEn: 'Available Quantities',
    subtitleEn: 'Warehouse Stock',
    icon: Icons.warehouse_rounded,
    color1: AppColors.neonYellow,
    color2: AppColors.neonAmber,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'الزيارات',
    subtitleAr: 'خارج الخطة / الخطة',
    titleEn: 'Visits',
    subtitleEn: 'Outside Plan / Plan',
    icon: Icons.map_rounded,
    color1: AppColors.neonCyan,
    color2: AppColors.neonSky,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: 'تقرير الزيارات',
    subtitleAr: 'خارج الخطة / الخطة',
    titleEn: 'Visits Report',
    subtitleEn: 'Outside Plan / Plan',
    icon: Icons.bar_chart_sharp,
    color1: AppColors.neonMagenta,
    color2: AppColors.neonPink,
    onTap: () {},
  ),
  FeatureItemEntity(
    titleAr: "بطاقة العميل",
    subtitleAr: "معلومات العميل",
    titleEn: 'Customer Card',
    subtitleEn: 'Customer Info',
    icon: Icons.person_rounded,
    color1: AppColors.neonBlue,
    color2: AppColors.neonCyan,
    onTap: () {},
  ),
];
