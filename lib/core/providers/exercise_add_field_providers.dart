import 'package:fitness_app/models/exercise_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseNameProvider = StateProvider<String>((ref) => "");
final exerciseTimeProvider = StateProvider<int>((ref) => 0);
final exerciseTypeProvider = StateProvider<ExerciseType?>((ref) => null);
