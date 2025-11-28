// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.isDark, required this.child});
  final bool isDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withOpacity(0.06) : Colors.white.withOpacity(0.78),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isDark ? Colors.white.withOpacity(0.12) : Colors.black.withOpacity(0.06),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 26,
                offset: const Offset(0, 14),
                color: Colors.black.withOpacity(isDark ? 0.20 : 0.07),
              ),
            ],
          ),

          child: child,
        ),
      ),
    );
  }
}
