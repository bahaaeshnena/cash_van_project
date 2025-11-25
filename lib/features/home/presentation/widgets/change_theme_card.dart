import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:cach_van/main.dart';
import 'package:flutter/material.dart';

class ChangeThemeCard extends StatefulWidget {
  const ChangeThemeCard({
    super.key,
  });

  @override
  State<ChangeThemeCard> createState() => _ChangeThemeCardState();
}

class _ChangeThemeCardState extends State<ChangeThemeCard> {
  @override
  Widget build(BuildContext context) {
    final isDark = MyApp.of(context).themeMode == ThemeMode.dark;

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
          S.of(context).changeTheme,
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          S.of(context).changeThemeTitle,
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
          onChanged: (value) {
            MyApp.of(context).changeTheme(value);
          },
        ),
      ),
    );
  }
}
