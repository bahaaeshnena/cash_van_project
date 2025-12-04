// ignore_for_file: deprecated_member_use

import 'package:cach_van/core/utils/constants/ui/app_colors.dart';
import 'package:cach_van/core/utils/constants/ui/app_text_styles.dart';
import 'package:cach_van/features/attendance/presentation/widgets/card_shell.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  final String title;
  final String? badgeText;
  final double panelHeight;
  final List<String> columns;
  final List<List<Widget>> rows;
  final List<int>? flexes;

  const CustomTable({
    super.key,
    required this.title,
    this.badgeText,
    required this.panelHeight,
    required this.columns,
    required this.rows,
    this.flexes,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  final ScrollController _historyScrollCtrl = ScrollController();

  @override
  dispose() {
    _historyScrollCtrl.dispose();
    super.dispose();
  }

  int _flexForIndex(int index) {
    if (widget.flexes == null || widget.flexes!.length != widget.columns.length) {
      return 1;
    }
    return widget.flexes![index];
  }

  @override
  Widget build(BuildContext context) {
    return CardShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextStyles.title(
                    context,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (widget.badgeText != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: AppColors.neonBlue.withOpacity(0.10),
                    border: Border.all(
                      color: AppColors.neonBlue.withOpacity(0.22),
                    ),
                  ),
                  child: Text(
                    widget.badgeText!,
                    style: AppTextStyles.label(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          _TableRowShell(
            isHeader: true,
            child: Row(
              children: List.generate(widget.columns.length, (i) {
                return _Cell(
                  flex: _flexForIndex(i),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    widget.columns[i],
                    style: AppTextStyles.label(context).copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: widget.panelHeight,
            child: Scrollbar(
              controller: _historyScrollCtrl,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _historyScrollCtrl,
                child: Column(
                  children: List.generate(widget.rows.length, (rowIndex) {
                    final rowCells = widget.rows[rowIndex];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _TableRowShell(
                        child: Row(
                          children: List.generate(widget.columns.length, (colIndex) {
                            return _Cell(
                              flex: _flexForIndex(colIndex),
                              child: rowCells[colIndex],
                            );
                          }),
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
