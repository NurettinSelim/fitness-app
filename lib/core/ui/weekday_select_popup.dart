import 'package:fitness_app/core/routes/router.dart';
import 'package:fitness_app/core/utils/week_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeekdaySelectPopup extends ConsumerWidget {
  const WeekdaySelectPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekdayNames = WeekHelper.weekdayNames;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
          title: Text(weekdayNames[index].capitalize()),
          onTap: () {
            final goRouter = ref.read(routerProvider);
            goRouter.goNamed(Routes.exercises.name, queryParams: {
              "weekday":
                  WeekHelper.weekdayNameToNum(weekdayNames[index]).toString()
            });
            Navigator.pop(context);
          },
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: weekdayNames.length,
      ),
    );
  }
}
