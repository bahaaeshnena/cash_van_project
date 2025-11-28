import 'package:cach_van/core/common/helpers/build_custom_app_bar.dart';
import 'package:cach_van/core/utils/constants/ui/assets.dart';
import 'package:cach_van/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: S.of(context).profile,
        subtitle: S.of(context).profileTitle,
        iconSvg: Assets.assetsImagesIconsUser,
      ),
      body: ProfileViewBody(),
    );
  }
}
