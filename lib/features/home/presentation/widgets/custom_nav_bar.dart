import 'package:cach_van/core/utils/helpers/device_utility.dart';
import 'package:cach_van/features/home/domain/bottom_navigation_bar_entity.dart';
import 'package:cach_van/features/home/presentation/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtility.getScreenWidth(context) * 0.3,
        vertical: 8,
      ),
      child: TweenAnimationBuilder<double>(
        key: ValueKey(selectedIndex),
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeOutBack,
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) {
          final double scale = 0.96 + (0.04 * value);
          final double yOffset = -4 * value;

          return Transform.translate(
            offset: Offset(0, yOffset),
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: bottomNavigationBarItems.asMap().entries.map((e) {
              final index = e.key;
              final item = e.value;
              final bool isSelected = selectedIndex == index;

              return Expanded(
                child: InkWell(
                  key: ValueKey(index),
                  splashColor: Colors.transparent,
                  onTap: () => onItemSelected(index),
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    tween: Tween<double>(
                      begin: isSelected ? 1.0 : 0.0,
                      end: isSelected ? 1.0 : 0.0,
                    ),
                    builder: (context, value, child) {
                      final double scale = 0.9 + (0.12 * value);

                      final double alignY = 0.5 + (-1.0 - 0.5) * value;

                      return Align(
                        alignment: Alignment(0, alignY),
                        child: Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                      );
                    },
                    child: NavigationBarItem(
                      isSelected: isSelected,
                      bottomNavigationBarEntity: item,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
