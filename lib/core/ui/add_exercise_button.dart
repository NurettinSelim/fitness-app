import 'package:fitness_app/core/providers/exercise_add_field_providers.dart';
import 'package:fitness_app/core/providers/weekday_selector_provider.dart';
import 'package:fitness_app/core/services/exercises_manager.dart';
import 'package:fitness_app/core/utils/week_helper.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExerciseButton extends ConsumerWidget {
  const AddExerciseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const ExerciseType exerciseType = ExerciseType.cooldown;
    final String exerciseName = ref.watch(exerciseNameProvider).text;
    final int exerciseTime =
        int.tryParse(ref.watch(exerciseTimeProvider).text) ?? 0;
    String selectedWeekdayName = ref.watch(weekdaySelectorProvider).first;
    return ElevatedButton(
      onPressed: () {
        ExercisesManager().addExercisesToDay(
          Exercise(exerciseType, exerciseName, exerciseTime),
          WeekHelper.weekdayNameToNum(selectedWeekdayName),
        );
      },
      child: Text(
          "Add to ${ref.watch(weekdaySelectorProvider).first.capitalize()}"),
    );
  }
}