import 'package:fitness_app/core/routes/router.dart';
import 'package:fitness_app/core/services/auth_service.dart';
import 'package:fitness_app/core/services/exercises_manager.dart';
import 'package:fitness_app/core/ui/add_exercise_popup.dart';
import 'package:fitness_app/core/ui/weekday_select_popup.dart';
import 'package:fitness_app/core/utils/week_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key, required this.weekdayNum});
  final int weekdayNum;

  @override
  Widget build(BuildContext context) {
    final ExercisesManager exercisesManager = ExercisesManager();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(WeekHelper.getWeekdayNameFromNumber(weekdayNum).capitalize()),
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) => const WeekdaySelectPopup());
            },
            icon: const Icon(Icons.calendar_month),
          ),
          IconButton(
            onPressed: () async {
              AuthService().signOut(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddExercisePopup(weekdayNum: weekdayNum),
          );
        },
        label: const Text("Add Training"),
        icon: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
          valueListenable:
              exercisesManager.getExercisesListenableByDay(weekdayNum),
          builder: (context, snapshot, child) {
            final exercises = exercisesManager.getExercisesByDay(weekdayNum);
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    "assets/fitness_icons/${exercises[index].type.name}.png",
                    color: Theme.of(context).colorScheme.onBackground,
                    height: 40,
                  ),
                  title: Text(
                      "${exercises[index].name} - ${exercises[index].time} min"),
                  onTap: () {
                    context.pushNamed(Routes.exerciseEdit.name, queryParams: {
                      "weekday": weekdayNum.toString(),
                      "exerciseIndex": index.toString(),
                    });
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      exercisesManager.deleteExerciseByIndex(index, weekdayNum);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: exercises.length,
            );
          }),
    );
  }
}
