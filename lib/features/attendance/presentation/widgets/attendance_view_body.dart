import 'package:cach_van/core/common/helpers/is_arabic.dart';
import 'package:cach_van/core/common/widgets/custom_back_ground.dart';
import 'package:cach_van/core/common/widgets/custom_google_map.dart';
import 'package:cach_van/core/common/widgets/custom_text_form_field.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AttendanceViewBody extends StatefulWidget {
  const AttendanceViewBody({super.key});

  @override
  State<AttendanceViewBody> createState() => _AttendanceViewBodyState();
}

class _AttendanceViewBodyState extends State<AttendanceViewBody> {
  final TextEditingController _notesCtrl = TextEditingController();

  // ✅ مهم للـ Scrollbar
  final ScrollController _historyScrollCtrl = ScrollController();

  bool _startLoading = false;
  bool _endLoading = false;

  @override
  void dispose() {
    _notesCtrl.dispose();
    _historyScrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _onStart() async {
    setState(() => _startLoading = true);
    try {
      final notes = _notesCtrl.text.trim();
      await Future.delayed(const Duration(milliseconds: 350));
      // TODO: Start attendance + notes
      // ignore: unused_local_variable
      final _ = notes;
    } finally {
      if (mounted) setState(() => _startLoading = false);
    }
  }

  Future<void> _onEnd() async {
    setState(() => _endLoading = true);
    try {
      final notes = _notesCtrl.text.trim();
      await Future.delayed(const Duration(milliseconds: 350));
      // TODO: End attendance + notes
      // ignore: unused_local_variable
      final _ = notes;
    } finally {
      if (mounted) setState(() => _endLoading = false);
    }
  }

  // ====== Demo data: آخر 10 أيام ======
  List<_AttendanceRow> _last10Days() {
    final now = DateTime.now();
    return List.generate(10, (i) {
      final d = now.subtract(Duration(days: i));
      return _AttendanceRow(
        date: d,
        dayName: _arabicDayName(d.weekday),
        startTime: i == 2 ? "—" : "08:30",
        endTime: i == 2 ? "—" : "16:30",
        notes: i == 0 ? "دوام اليوم" : "—",
      );
    });
  }

  String _arabicDayName(int weekday) {
    final isArabic = isArabicFun();
    switch (weekday) {
      case 1:
        return isArabic ? "الأحد" : "Sunday";
      case 2:
        return isArabic ? "الاثنين" : "Monday";
      case 3:
        return isArabic ? "الثلاثاء" : "Tuesday";
      case 4:
        return isArabic ? "الاربعاء" : "Wednesday";
      case 5:
        return isArabic ? "الخميس" : "Thursday";
      case 6:
        return isArabic ? "الجمعة" : "Friday";
      case 7:
        return isArabic ? "السبت" : "Saturday";

      default:
        return "";
    }
  }

  String _fmtDate(DateTime d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.day)}/${two(d.month)}/${d.year}";
  }

  @override
  Widget build(BuildContext context) {
    final rows = _last10Days();

    return CustomBackGround(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== Actions Card =====
              _CardShell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "الإجراءات",
                      style: AppTextStyles.title(
                        context,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      label: "ملاحظات",
                      hint: "اكتب ملاحظة إن وجدت...",
                      controller: _notesCtrl,
                      maxLines: 3,
                      paddingHorizontal: 0,
                    ),
                    const SizedBox(height: 12),
                    LayoutBuilder(
                      builder: (context, c) {
                        final narrow = c.maxWidth < 520;

                        final startBtn = CustomElevatedButton(
                          label: "بداية الدوام",
                          isLoading: _startLoading,
                          onPressed: (_startLoading || _endLoading) ? () {} : _onStart,
                          icon: const Icon(Icons.play_arrow_rounded),
                        );

                        final endBtn = CustomElevatedButton(
                          label: "نهاية الدوام",
                          isLoading: _endLoading,
                          onPressed: (_startLoading || _endLoading) ? () {} : _onEnd,
                          backgroundColor: AppColors.neonRed,
                          icon: const Icon(Icons.stop_rounded),
                        );

                        if (narrow) {
                          return Column(
                            children: [
                              SizedBox(width: double.infinity, child: startBtn),
                              const SizedBox(height: 10),
                              SizedBox(width: double.infinity, child: endBtn),
                            ],
                          );
                        }

                        return Row(
                          children: [
                            Expanded(child: startBtn),
                            const SizedBox(width: 12),
                            Expanded(child: endBtn),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // ===== Map + Table side-by-side =====
              LayoutBuilder(
                builder: (context, c) {
                  final wide = c.maxWidth >= 980;
                  final double panelHeight = wide ? 460 : 320;

                  final mapCard = _CardShell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "الموقع الحالي",
                                style: AppTextStyles.title(
                                  context,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: AppColors.neonCyan.withOpacity(0.12),
                                border: Border.all(color: AppColors.neonCyan.withOpacity(0.25)),
                              ),
                              child: Text(
                                "GPS",
                                style: AppTextStyles.label(context).copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            height: panelHeight,
                            child: const CustomGoogleMap(),
                          ),
                        ),
                      ],
                    ),
                  );

                  final tableCard = _CardShell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "آخر 10 أيام",
                                style: AppTextStyles.title(
                                  context,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: AppColors.neonBlue.withOpacity(0.10),
                                border: Border.all(color: AppColors.neonBlue.withOpacity(0.22)),
                              ),
                              child: Text(
                                "${rows.length} يوم",
                                style: AppTextStyles.label(context).copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Header row
                        _TableRowShell(
                          isHeader: true,
                          child: Row(
                            children: [
                              _Cell(
                                flex: 4,
                                child: Text(
                                  "اليوم/التاريخ",
                                  style: AppTextStyles.label(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.w800),
                                ),
                              ),
                              _Cell(
                                flex: 2,
                                child: Text(
                                  "بداية",
                                  style: AppTextStyles.label(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.w800),
                                ),
                              ),
                              _Cell(
                                flex: 2,
                                child: Text(
                                  "نهاية",
                                  style: AppTextStyles.label(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.w800),
                                ),
                              ),
                              _Cell(
                                flex: 4,
                                child: Text(
                                  "ملاحظات",
                                  style: AppTextStyles.label(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Body (Scrollable) ✅ مع controller
                        SizedBox(
                          height: panelHeight,
                          child: Scrollbar(
                            controller: _historyScrollCtrl,
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              controller: _historyScrollCtrl,
                              child: Column(
                                children: List.generate(rows.length, (i) {
                                  final r = rows[i];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: _TableRowShell(
                                      child: Row(
                                        children: [
                                          _Cell(
                                            flex: 4,
                                            child: Text(
                                              "${r.dayName} - ${_fmtDate(r.date)}",
                                              style: AppTextStyles.body(
                                                context,
                                              ).copyWith(fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          _Cell(
                                            flex: 2,
                                            child: _Pill(
                                              text: r.startTime,
                                              ok: r.startTime != "—",
                                            ),
                                          ),
                                          _Cell(
                                            flex: 2,
                                            child: _Pill(
                                              text: r.endTime,
                                              ok: r.endTime != "—",
                                            ),
                                          ),
                                          _Cell(
                                            flex: 4,
                                            child: Text(
                                              r.notes,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyles.body(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );

                  if (wide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 5, child: mapCard),
                        const SizedBox(width: 12),
                        Expanded(flex: 5, child: tableCard),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      mapCard,
                      const SizedBox(height: 12),
                      tableCard,
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== Helpers UI =====

class _CardShell extends StatelessWidget {
  final Widget child;
  const _CardShell({required this.child});

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: surface.withOpacity(0.72),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.08),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _TableRowShell extends StatelessWidget {
  final Widget child;
  final bool isHeader;
  const _TableRowShell({required this.child, this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: isHeader ? Colors.black.withOpacity(0.04) : surface.withOpacity(0.55),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: child,
    );
  }
}

class _Cell extends StatelessWidget {
  final int flex;
  final Widget child;
  const _Cell({required this.flex, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: child,
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  final bool ok;
  const _Pill({required this.text, required this.ok});

  @override
  Widget build(BuildContext context) {
    final bg = ok ? AppColors.neonGreen.withOpacity(0.12) : AppColors.neonOrange.withOpacity(0.12);
    final br = ok ? AppColors.neonGreen.withOpacity(0.30) : AppColors.neonOrange.withOpacity(0.30);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: bg,
        border: Border.all(color: br),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.label(context).copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

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
