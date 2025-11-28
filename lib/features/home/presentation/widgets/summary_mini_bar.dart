// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:cach_van/core/common/helpers/is_dark.dart';

class SummaryMiniBar extends StatelessWidget {
  const SummaryMiniBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = isDarkFun(context);

    return Container(
      height: 5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: dark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.06),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 5,
          width: 46,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(dark ? 0.55 : 0.35),
                Colors.white.withOpacity(dark ? 0.22 : 0.18),
              ],
            ),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }
}
