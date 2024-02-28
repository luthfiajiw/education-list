import 'package:education_list/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static ThemeData buildTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.secondary),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
        scrolledUnderElevation: 1,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black,
      ),
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Palette.neutralCaption
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Palette.neutralTitle,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Palette.neutralTitle,
          ),
        )
      ).apply(
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
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w300,
          fontSize: 14
        ),
        filled: true,
        fillColor: Palette.neutralBtn,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
      )
    );
  }
}