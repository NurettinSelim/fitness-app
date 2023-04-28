import 'package:hive_flutter/hive_flutter.dart';
part 'exercise_type.g.dart';

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
