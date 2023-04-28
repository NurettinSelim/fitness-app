import 'package:hive/hive.dart';
import 'package:fitness_app/models/exercise_type.dart';
part 'exercise.g.dart';

@HiveType(typeId: 1)
class Exercise {
  @HiveField(0)
  ExerciseType type;
  @HiveField(1)
  String name;
  @HiveField(2)
  int time;

  Exercise(this.type, this.name, this.time);
}
