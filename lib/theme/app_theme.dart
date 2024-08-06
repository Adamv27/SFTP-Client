import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static ButtonStyle _buttonStyle(ColorScheme colorScheme) {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
      backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
    );
  }

  static ThemeData get light {
    final baseLightTheme = ThemeData.from(colorScheme: _light);
    return baseLightTheme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: _buttonStyle(baseLightTheme.colorScheme),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(baseLightTheme.textTheme));
  }

  static ThemeData get dark {
    final baseDarkTheme = ThemeData.from(colorScheme: _dark);

    return baseDarkTheme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: _buttonStyle(baseDarkTheme.colorScheme)),
        textTheme: GoogleFonts.poppinsTextTheme(baseDarkTheme.textTheme));
  }
}
