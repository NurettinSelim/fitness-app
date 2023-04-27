// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final int typeId = 1;

  @override
  Exercise read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      fields[0] as ExerciseType,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.weekNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
        return ExerciseType.cycle;
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
      case ExerciseType.cycle:
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
