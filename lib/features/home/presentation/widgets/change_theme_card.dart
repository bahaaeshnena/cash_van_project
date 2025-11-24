import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChangeThemeCard extends StatelessWidget {
  const ChangeThemeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.light;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.dark_mode_outlined,
          size: 28,
        ),
        title: Text(
          'Change Theme',
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          'Light / Dark mode',
          style: AppTextStyles.body(context).copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        trailing: Switch.adaptive(
          value: isDark,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
