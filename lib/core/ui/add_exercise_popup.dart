import 'package:fitness_app/core/ui/add_exercise_button.dart';
import 'package:fitness_app/core/ui/exercise_type_slider.dart';
import 'package:fitness_app/core/ui/weekday_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness_app/core/utils/theme_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/core/providers/exercise_add_field_providers.dart';

class AddExercisePopup extends ConsumerWidget {
  const AddExercisePopup({super.key, required this.weekdayNum});
  final int weekdayNum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ExerciseTypeSlider(),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              ref.read(exerciseNameProvider.notifier).state = value;
            },
            decoration: ThemeHelper.formFieldDecoration.copyWith(
              labelText: "Training Name",
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              ref.read(exerciseTimeProvider.notifier).state =
                  int.tryParse(value) ?? 0;
            },
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: ThemeHelper.formFieldDecoration.copyWith(
              labelText: "Training Time (minutes)",
            ),
          ),
          const SizedBox(height: 10),
          const WeekdaySelector(),
          const SizedBox(height: 10),
          const AddExerciseButton()
        ],
      ),
    );
  }
}
