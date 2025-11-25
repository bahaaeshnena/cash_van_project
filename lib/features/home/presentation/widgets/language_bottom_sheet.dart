// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:cach_van/main.dart';

Future<void> showLanguageBottomSheet(BuildContext context) async {
  final rootContext = Navigator.of(context).overlay!.context;
  final appState = MyApp.of(rootContext);
  final currentCode = appState.locale.languageCode;

  Widget langCard({
    required String code,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final isSelected = currentCode == code;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        appState.changeLanguage(code);
        Navigator.pop(rootContext);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(rootContext).cardColor,
          border: Border.all(
            color: isSelected
                ? Theme.of(rootContext).colorScheme.primary
                : Colors.grey.withOpacity(0.25),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: isSelected
                        ? Theme.of(rootContext).colorScheme.primary.withOpacity(0.14)
                        : Colors.grey.withOpacity(0.12),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: isSelected
                        ? Theme.of(rootContext).colorScheme.primary
                        : Theme.of(rootContext).iconTheme.color,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.title(rootContext).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: isSelected ? 1 : 0.9,
                  child: Icon(
                    isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: isSelected ? Theme.of(rootContext).colorScheme.primary : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  await showModalBottomSheet(
    context: rootContext,
    showDragHandle: true,
    backgroundColor: Theme.of(rootContext).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(rootContext).colorScheme.primary.withOpacity(0.14),
                    ),
                    child: Icon(
                      Icons.language,
                      color: Theme.of(rootContext).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(rootContext).changeLanguage,
                          style: AppTextStyles.title(rootContext).copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          S.of(rootContext).changeLanguageTitle,
                          style: AppTextStyles.body(rootContext).copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Options
              Row(
                children: [
                  Expanded(
                    child: langCard(
                      code: 'ar',
                      icon: Icons.translate,
                      title: 'العربية',
                      subtitle: 'Arabic',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: langCard(
                      code: 'en',
                      icon: Icons.public,
                      title: 'English',
                      subtitle: 'إنجليزي',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      );
    },
  );
}
