import 'package:cach_van/core/services/shared_prefs.dart';
import 'package:cach_van/core/utils/constants/constants.dart';
import 'package:cach_van/core/utils/helpers/device_utility.dart';
import 'package:cach_van/features/auth/presentation/login_view.dart';
import 'package:cach_van/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:cach_van/features/on_boarding/presentation/widgets/dots_indicator.dart';
import 'package:cach_van/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:cach_van/features/on_boarding/presentation/widgets/skip_button.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SkipButton(),
              Expanded(
                child: OnBoardingPageView(
                  pageController: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => DotsIndicator(
                    isActive: currentPage == index,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Visibility(
                visible: currentPage == 2,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: DeviceUtility.getScreenWidth(context) * 0.3,
                  ),
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginView.routeName);
                      Prefs.setBool(kIsOnBoardingView, true);
                    },
                    label: S.of(context).getStarted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
