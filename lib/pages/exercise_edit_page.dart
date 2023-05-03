import 'package:fitness_app/core/services/exercises_manager.dart';
import 'package:fitness_app/core/utils/theme_helper.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ExerciseEditPage extends StatefulWidget {
  const ExerciseEditPage({
    super.key,
    required this.exerciseIndex,
    required this.weekdayNum,
  });
  final int exerciseIndex;
  final int weekdayNum;

  @override
  State<ExerciseEditPage> createState() => _ExerciseEditPageState();
}

class _ExerciseEditPageState extends State<ExerciseEditPage> {
  late Exercise exercise;
  late TextEditingController nameController;
  late TextEditingController timeController;
  @override
  void initState() {
    exercise = ExercisesManager().getExercisesByIndex(
      widget.exerciseIndex,
      widget.weekdayNum,
    );
    nameController = TextEditingController(text: exercise.name);
    timeController = TextEditingController(text: exercise.time.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training Edit Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: ThemeHelper.formFieldDecoration.copyWith(
                labelText: "Training Name",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: ThemeHelper.formFieldDecoration.copyWith(
                labelText: "Training Time (minutes)",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Exercise newExercise = Exercise(
                  exercise.type,
                  nameController.text,
                  int.tryParse(timeController.text) ?? 0,
                );
                ExercisesManager().editExercise(
                    widget.exerciseIndex, widget.weekdayNum, newExercise);
                context.pop();
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
