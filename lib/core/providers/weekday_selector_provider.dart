import 'package:fitness_app/core/utils/week_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weekdaySelectorProvider = StateProvider<Set<String>>((ref) {
  return {WeekHelper.weekdayNames.first};
});
