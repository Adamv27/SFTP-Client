import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final buttonColors = WindowButtonColors(
    iconNormal: Colors.white,
    mouseOver: const Color(0xFF845BF5),
    mouseDown: const Color.fromARGB(255, 113, 79, 207),
  );

  static final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: Colors.white,
  );

  static const ColorScheme _light = ColorScheme.light(
    primary: Colors.white,
  );

  static const ColorScheme _dark = ColorScheme.dark(
    primary: Color(0xFF9965F4),
    secondary: Color(0xFFAAF255),
    primaryContainer: Color(0xFF202529),
    secondaryContainer: Color(0xFF292E32),
    onPrimaryContainer: Color(0xFFDDDDDD),
    onSecondaryContainer: Color(0xFF6A6A6A),
  );

  static ThemeData get light => ThemeData.from(colorScheme: _light);
  static ThemeData get dark => ThemeData.from(colorScheme: _dark);
}
