// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 4,
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24),
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 6),
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
    ),
    leadingWidth: 80,
    leading: Builder(
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 24,
        ),
        child: IconButton(
          iconSize: 34,
          icon: const Icon(Icons.menu_rounded, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    ),
    titleSpacing: 0,
    title: Padding(
      padding: EdgeInsets.only(
        right: 24,
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.12),
            ),
            child: const Icon(
              Icons.local_shipping_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 16),
          // Title + Subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cash Van',
                style: AppTextStyles.title(context).copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Daily operations overview',
                style: AppTextStyles.body(context).copyWith(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
            iconSize: 28,
            onPressed: () {},
          ),
          //    SvgPicture.asset(
          //   Assets.assetsImagesIconsNotification,
          //   fit: BoxFit.scaleDown,
          // ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
