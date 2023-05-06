import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class ExercisesManager {
  static Future<void> openExercisesBoxes() async {
    for (var i = 0; i < 7; i++) {
      await Hive.openBox<Exercise>('{$i}exercisesBox');
    }
  }

  static Box<Exercise> getExercisesBoxByDay(int weekdayNum) =>
      Hive.box<Exercise>('{$weekdayNum}exercisesBox');

  void addExercisesToDay(Exercise exercise, int weekdayNum) {
    getExercisesBoxByDay(weekdayNum).add(exercise);
  }

  List<Exercise> getExercisesByDay(int weekdayNum) {
    return getExercisesBoxByDay(weekdayNum).values.toList();
  }

  Exercise getExercisesByIndex(int index, int weekdayNum) {
    return getExercisesBoxByDay(weekdayNum).getAt(index)!;
  }

  void deleteExerciseByIndex(int index, int weekdayNum) {
    getExercisesBoxByDay(weekdayNum).deleteAt(index);
  }

  void editExercise(int index, int weekdayNum, Exercise exercise) {
    getExercisesBoxByDay(weekdayNum).putAt(index, exercise);
  }

  ValueListenable<Box<Exercise>> getExercisesListenableByDay(int weekdayNum) {
    return getExercisesBoxByDay(weekdayNum).listenable();
  }
}
