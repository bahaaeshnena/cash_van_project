import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/features/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: [
        PageViewItem(
          title: S.of(context).onBoardingTitle1,
          image: Assets.assetsImagesOnBoardingImage1,
          subtitle: S.of(context).onBoardingSubtitle1,
        ),
        PageViewItem(
          title: S.of(context).onBoardingTitle2,
          image: Assets.assetsImagesOnBoardingImage2,
          subtitle: S.of(context).onBoardingSubtitle2,
        ),
        PageViewItem(
          title: S.of(context).onBoardingTitle3,
          image: Assets.assetsImagesOnBoardingImage3,
          subtitle: S.of(context).onBoardingSubtitle3,
        ),
      ],
    );
  }
}
