// ignore_for_file: deprecated_member_use
import 'package:cach_van/core/common/helpers/device_utility.dart';
import 'package:cach_van/core/common/widgets/custom_back_ground.dart';
import 'package:cach_van/core/common/widgets/custom_table.dart';
import 'package:cach_van/core/common/widgets/custom_text_form_field.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/features/attendance/presentation/widgets/card_shell.dart';
import 'package:cach_van/features/attendance/presentation/widgets/pill_widget.dart';
import 'package:cach_van/features/attendance/presentation/widgets/section_map.dart';
import 'package:cach_van/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:cach_van/generated/l10n.dart';
import 'package:flutter/material.dart';

class AttendanceViewBody extends StatelessWidget {
  const AttendanceViewBody({super.key});

  // ====== Demo data 10 days ======
  List<_AttendanceRow> _last10Days() {
    final now = DateTime.now();
    return List.generate(10, (i) {
      final d = now.subtract(Duration(days: i));
      return _AttendanceRow(
        date: d,
        dayName: DeviceUtility.arabicDayName(d.weekday),
        startTime: i == 2 ? "—" : "08:30",
        endTime: i == 2 ? "—" : "16:30",
        notes: i == 0 ? "دوام اليوم" : "—",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final attendanceRows = _last10Days();

    final List<List<Widget>> rows = attendanceRows.map((r) {
      return [
        Text(
          "${r.dayName} - ${DeviceUtility.fmtDate(r.date)}",
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        PillWidget(
          text: r.startTime,
          ok: r.startTime != "—",
        ),
        PillWidget(
          text: r.endTime,
          ok: r.endTime != "—",
        ),
        Text(
          r.notes,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body(context),
        ),
      ];
    }).toList();

    return CustomBackGround(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardShell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).procedures,
                      style: AppTextStyles.title(
                        context,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      label: S.of(context).notes,
                      hint: S.of(context).notesHint,
                      maxLines: 3,
                      paddingHorizontal: 0,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            label: S.of(context).startAttendance,
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow_rounded),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomElevatedButton(
                            label: S.of(context).endAttendance,
                            onPressed: () {},
                            backgroundColor: AppColors.neonRed,
                            icon: const Icon(Icons.stop_rounded),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: SectionMap(panelHeight: 460),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 5,
                    child: CustomTable(
                      title: S.of(context).last10Days,
                      badgeText: "${attendanceRows.length} ${S.of(context).days}",
                      panelHeight: 460,
                      columns: <String>[
                        "${S.of(context).day} - ${S.of(context).date}",
                        S.of(context).startAttendance,
                        S.of(context).endAttendance,
                        S.of(context).notes,
                      ],
                      rows: rows,
                      flexes: const [4, 3, 3, 4],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Demo model
class _AttendanceRow {
  final DateTime date;
  final String dayName;
  final String startTime;
  final String endTime;
  final String notes;

  const _AttendanceRow({
    required this.date,
    required this.dayName,
    required this.startTime,
    required this.endTime,
    required this.notes,
  });
}
