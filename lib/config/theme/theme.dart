import 'package:education_list/config/theme/palette.dart';
import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData buildTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black,
      ),
      textTheme: const TextTheme().apply(
        bodyColor: Palette.mainText,
        displayColor: Palette.mainText
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Palette.primary,
        selectedLabelStyle: const TextStyle(
          fontSize: 12
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12
        ),
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
      useMaterial3: true,
    );
  }
}