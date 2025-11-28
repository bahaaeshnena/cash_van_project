import 'package:cach_van/core/common/widgets/account_details.dart';
import 'package:cach_van/core/common/widgets/custom_back_ground.dart';
import 'package:cach_van/core/common/widgets/quick_over_view.dart';
import 'package:cach_van/features/profile/presentation/widgets/header_profile_view.dart';

import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackGround(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                child: HeaderProfileView(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
                child: LayoutBuilder(
                  builder: (context, c) {
                    final wide = c.maxWidth >= 980;
                    final detailsCard = AccountDetails();
                    final overviewCard = QuickOverViwe();
                    if (wide) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 6, child: detailsCard),
                          const SizedBox(width: 16),
                          Expanded(flex: 5, child: overviewCard),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        detailsCard,
                        const SizedBox(height: 16),
                        overviewCard,
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
