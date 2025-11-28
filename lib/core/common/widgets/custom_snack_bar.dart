// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    bool isError = false,
  }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _SnackBarOverlay(
        message: message,
        isError: isError,
        onDismissed: () {
          if (entry.mounted) entry.remove();
        },
      ),
    );

    overlay.insert(entry);
  }
}

class _SnackBarOverlay extends StatefulWidget {
  final String message;
  final bool isError;
  final VoidCallback onDismissed;

  const _SnackBarOverlay({
    required this.message,
    required this.isError,
    required this.onDismissed,
  });

  @override
  State<_SnackBarOverlay> createState() => _SnackBarOverlayState();
}

class _SnackBarOverlayState extends State<_SnackBarOverlay> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 180),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.35),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    // مدة العرض (عدّلها)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) _dismiss();
    });
  }

  void _dismiss() {
    if (!mounted) return;
    if (_controller.status == AnimationStatus.dismissed ||
        _controller.status == AnimationStatus.reverse) {
      return;
    }

    _controller.reverse().whenComplete(() {
      if (mounted) widget.onDismissed();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final w = MediaQuery.of(context).size.width;

    // Tablet friendly max width
    final maxW = w >= 900 ? 720.0 : (w >= 600 ? 560.0 : w - 32);

    final base = widget.isError ? AppColors.neonRed : AppColors.neonGreen;
    final accent = widget.isError ? AppColors.neonOrange : AppColors.neonCyan;

    // ألوان أوضح (أقوى)
    final c1 = base.withOpacity(isDark ? 0.62 : 0.92);
    final c2 = accent.withOpacity(isDark ? 0.42 : 0.70);

    final icon = widget.isError ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded;

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            child: SlideTransition(
              position: _slide,
              child: FadeTransition(
                opacity: _fade,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxW),
                  child: GestureDetector(
                    onTap: _dismiss,
                    onVerticalDragUpdate: (d) {
                      if ((d.primaryDelta ?? 0) < -6) _dismiss();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [c1, c2],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(
                              color: accent.withOpacity(isDark ? 0.55 : 0.70),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 22,
                                offset: const Offset(0, 12),
                                color: base.withOpacity(isDark ? 0.28 : 0.18),
                              ),
                              BoxShadow(
                                blurRadius: 26,
                                offset: const Offset(0, 14),
                                color: Colors.black.withOpacity(isDark ? 0.18 : 0.10),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // شريط accent أوضح
                              Container(
                                width: 5,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: base,
                                  borderRadius: BorderRadius.circular(99),
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Icon bubble
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white.withOpacity(isDark ? 0.16 : 0.18),
                                ),
                                child: Icon(icon, color: Colors.white, size: 24),
                              ),
                              const SizedBox(width: 12),

                              Expanded(
                                child: Text(
                                  widget.message,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.98),
                                    fontSize: w >= 600 ? 15.5 : 14.5,
                                    height: 1.25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              IconButton(
                                onPressed: _dismiss,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white.withOpacity(0.92),
                                ),
                                splashRadius: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
