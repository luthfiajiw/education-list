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
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Palette.neutralCaption
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Palette.neutralTitle,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Palette.neutralTitle,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Palette.neutralTitle,
          ),
        )
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
          fontWeight: FontWeight.w400,
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
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: Palette.neutral
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12
          )
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primary.withOpacity(.1),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          side: BorderSide(
            width: 1,
            color: Palette.primary.withOpacity(.1)
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12
          )
        )
      )
    );
  }
}