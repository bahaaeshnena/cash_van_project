import 'package:cach_van/core/common/helpers/build_custom_app_bar.dart';
import 'package:cach_van/features/attendance/presentation/widgets/attendance_view_body.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  static const routeName = 'attendance_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        title: S.of(context).attendance,
        subtitle: S.of(context).attendanceTitle,
        iconMaterial: Icons.work_rounded,
      ),
      body: AttendanceViewBody(),
    );
  }
}
