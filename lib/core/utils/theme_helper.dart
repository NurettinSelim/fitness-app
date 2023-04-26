import 'package:flutter/material.dart';

class ThemeHelper {
  static final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF0F172A),
  );

  static final ThemeData themeData = ThemeData(
    fontFamily: "Moderat",
    useMaterial3: true,
    colorScheme: colorScheme,
  );
  static const formFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    hintText: "",
  );
}
