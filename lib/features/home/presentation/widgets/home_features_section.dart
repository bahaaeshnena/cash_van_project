import 'package:cach_van/features/home/domain/feature_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:cach_van/features/home/presentation/widgets/feature_card.dart';

class HomeFeaturesSection extends StatelessWidget {
  const HomeFeaturesSection({
    super.key,
    required this.items,
    required this.dark,
  });

  final List<FeatureItemEntity> items;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 520;
        final cross = isWide ? 3 : 2;
        final tileHeight = isWide ? 150.0 : 142.0;
        final ratio = (constraints.maxWidth / cross) / tileHeight;

        return GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cross,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) {
            return FeatureCard(
              item: items[index],
              dark: dark,
            );
          },
        );
      },
    );
  }
}
