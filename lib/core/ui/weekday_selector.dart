import 'package:fitness_app/core/providers/weekday_selector_provider.dart';
import 'package:fitness_app/core/utils/week_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeekdaySelector extends ConsumerWidget {
  const WeekdaySelector({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSet = ref.watch(weekdaySelectorProvider);
    return SegmentedButton<String>(
      segments: WeekHelper.weekdayNames
          .map((e) => ButtonSegment<String>(
                value: e,
                label: Text(e[0].capitalize()),
              ))
          .toList(),
      selected: selectedSet,
      onSelectionChanged: (Set<String> newSelection) {
        ref.read(weekdaySelectorProvider.notifier).state = newSelection;
      },
    );
  }
}
