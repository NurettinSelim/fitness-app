import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mailFieldProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final passwordFieldProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final nameFieldProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
