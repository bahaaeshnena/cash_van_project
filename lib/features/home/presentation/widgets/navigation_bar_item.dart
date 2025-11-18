import 'package:cach_van/features/home/domain/bottom_navigation_bar_entity.dart';
import 'package:cach_van/features/home/presentation/widgets/active_item_nav_bar.dart';
import 'package:cach_van/features/home/presentation/widgets/in_active_item_nav_bar.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 320),
        switchInCurve: Curves.easeOutBack,
        switchOutCurve: Curves.easeInQuad,
        transitionBuilder: (child, animation) {
          // تحريك طفيف + تكبير + فِيد
          final slideAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.2),
            end: Offset.zero,
          ).animate(animation);

          final scaleAnimation = Tween<double>(
            begin: 0.85,
            end: 1.0,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            ),
          );
        },
        child: isSelected
            ? ActiveItemNavBar(
                key: ValueKey('active_${bottomNavigationBarEntity.label}'),
                image: bottomNavigationBarEntity.activeImage,
                name: bottomNavigationBarEntity.label(context),
              )
            : InActiveItemNavBar(
                key: ValueKey('inactive_${bottomNavigationBarEntity.label}'),
                image: bottomNavigationBarEntity.inActiveImage,
                name: bottomNavigationBarEntity.label(context),
              ),
      ),
    );
  }
}
