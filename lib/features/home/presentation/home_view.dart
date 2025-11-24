// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/build_app_bar_home.dart';
import 'package:cach_van/features/home/presentation/widgets/build_drawer.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundColor,
      appBar: buildAppBar(context),
      drawer: BuildDrawer(),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
