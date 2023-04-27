import 'package:hive/hive.dart';
part 'exercise.g.dart';

@HiveType(typeId: 2)
enum ExerciseType {
  @HiveField(0)
  yoga,
  @HiveField(1)
  run,
  @HiveField(2)
  cycle,
  @HiveField(3)
  swim,
  @HiveField(4)
  pilates,
  @HiveField(5)
  cooldown,
}

@HiveType(typeId: 1)
class Exercise {
  @HiveField(0)
  ExerciseType type;
  @HiveField(1)
  String name;
  @HiveField(2)
  int time;
  @HiveField(3)
  int weekNumber;

  Exercise(this.type, this.name, this.time, this.weekNumber);
}
