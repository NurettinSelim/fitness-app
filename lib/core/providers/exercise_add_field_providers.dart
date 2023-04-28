import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseNameProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final exerciseTimeProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
// final exerciseTypeProvider =
//     StateProvider<TextEditingController>((ref) => TextEditingController());