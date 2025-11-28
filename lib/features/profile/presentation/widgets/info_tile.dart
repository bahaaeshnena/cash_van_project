// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:cach_van/core/common/helpers/is_dark.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkFun(context);
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: value.trim().isEmpty || value == '—'
          ? null
          : () async {
              await Clipboard.setData(ClipboardData(text: value));

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  elevation: 0,
                  backgroundColor: (isDark ? Colors.black : Colors.white).withOpacity(0.94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: accent.withOpacity(isDark ? 0.45 : 0.30),
                    ),
                  ),
                  content: Row(
                    children: [
                      Icon(
                        Icons.check_rounded,
                        size: 18,
                        color: accent,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${S.of(context).Copied}: $title',
                          style: AppTextStyles.body(context).copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white : Colors.black.withOpacity(0.85),
                          ),
                        ),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 1100),
                ),
              );
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              accent.withOpacity(isDark ? 0.16 : 0.10),
              (isDark ? Colors.white : Colors.black).withOpacity(isDark ? 0.04 : 0.02),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: (isDark ? Colors.white : Colors.black).withOpacity(isDark ? 0.10 : 0.05),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: accent.withOpacity(isDark ? 0.14 : 0.10),
                border: Border.all(color: accent.withOpacity(isDark ? 0.24 : 0.16)),
              ),
              child: Icon(icon, color: accent, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.copy_rounded,
              size: 18,
              color: (isDark ? Colors.white : Colors.black).withOpacity(0.30),
            ),
          ],
        ),
      ),
    );
  }
}
