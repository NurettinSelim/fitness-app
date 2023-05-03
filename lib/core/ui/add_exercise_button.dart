import 'package:fitness_app/core/providers/exercise_add_field_providers.dart';
import 'package:fitness_app/core/providers/weekday_selector_provider.dart';
import 'package:fitness_app/core/services/exercises_manager.dart';
import 'package:fitness_app/core/utils/week_helper.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/models/exercise_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExerciseButton extends ConsumerWidget {
  const AddExerciseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ExerciseType? exerciseType = ref.watch(exerciseTypeProvider);
    final String exerciseName = ref.watch(exerciseNameProvider);
    final int exerciseTime = ref.watch(exerciseTimeProvider) ?? 0;
    String selectedWeekdayName = ref.watch(weekdaySelectorProvider).first;
    return ElevatedButton(
      onPressed: () {
        if (exerciseType != null) {
          ExercisesManager().addExercisesToDay(
            Exercise(exerciseType, exerciseName, exerciseTime),
            WeekHelper.weekdayNameToNum(selectedWeekdayName),
          );
        } else {
          debugPrint("Exercise type not selected");
        }
      },
      child: Text(
          "Add to ${ref.watch(weekdaySelectorProvider).first.capitalize()}"),
    );
  }
}
