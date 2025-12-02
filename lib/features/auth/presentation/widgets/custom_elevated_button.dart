// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height = 52,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.elevation,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  final Widget? icon;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color effectiveTextColor = textColor ?? theme.colorScheme.onPrimary;

    // لو المستخدم مرّر backgroundColor => نستخدمه كزر عادي بدون gradient
    final Color solidBg = backgroundColor ?? theme.colorScheme.primary;

    // default "home neon" gradient
    final List<Color> gradientColors = [
      AppColors.primaryColor,
      Color.lerp(AppColors.primaryColor, AppColors.neonBlue, 0.35)!,
      AppColors.neonCyan.withOpacity(isDark ? 0.70 : 0.55),
    ];

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: backgroundColor != null
              ? null
              : LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          color: backgroundColor != null ? solidBg : null,
          boxShadow: [
            // glow خفيف يلابق كروت الهوم
            BoxShadow(
              blurRadius: 18,
              offset: const Offset(0, 10),
              color: (backgroundColor != null ? solidBg : AppColors.neonCyan).withOpacity(
                isDark ? 0.16 : 0.12,
              ),
            ),
            BoxShadow(
              blurRadius: 26,
              offset: const Offset(0, 14),
              color: Colors.black.withOpacity(isDark ? 0.18 : 0.10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style:
                ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: effectiveTextColor,
                  elevation: elevation ?? 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ).copyWith(
                  overlayColor: WidgetStatePropertyAll(
                    Colors.white.withOpacity(isDark ? 0.10 : 0.14),
                  ),
                ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(isDark ? 0.10 : 0.14),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: isLoading
                        ? SizedBox(
                            key: const ValueKey('loading'),
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                effectiveTextColor,
                              ),
                            ),
                          )
                        : Row(
                            key: const ValueKey('content'),
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (icon != null) ...[
                                IconTheme(
                                  data: IconThemeData(
                                    color: effectiveTextColor,
                                    size: 20,
                                  ),
                                  child: icon!,
                                ),
                                const SizedBox(width: 8),
                              ],
                              Text(
                                label,
                                style: AppTextStyles.body(context).copyWith(
                                  color: effectiveTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
