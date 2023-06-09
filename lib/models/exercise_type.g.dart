// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseTypeAdapter extends TypeAdapter<ExerciseType> {
  @override
  final int typeId = 2;

  @override
  ExerciseType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExerciseType.yoga;
      case 1:
        return ExerciseType.run;
      case 2:
        return ExerciseType.bicycle;
      case 3:
        return ExerciseType.swim;
      case 4:
        return ExerciseType.pilates;
      case 5:
        return ExerciseType.cooldown;
      default:
        return ExerciseType.yoga;
    }
  }

  @override
  void write(BinaryWriter writer, ExerciseType obj) {
    switch (obj) {
      case ExerciseType.yoga:
        writer.writeByte(0);
        break;
      case ExerciseType.run:
        writer.writeByte(1);
        break;
      case ExerciseType.bicycle:
        writer.writeByte(2);
        break;
      case ExerciseType.swim:
        writer.writeByte(3);
        break;
      case ExerciseType.pilates:
        writer.writeByte(4);
        break;
      case ExerciseType.cooldown:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
