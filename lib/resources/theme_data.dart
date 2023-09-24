import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: const Color(0xFFEEE7DF),
      appBarTheme: const AppBarTheme(
          centerTitle: true, color: Colors.transparent, elevation: 0.0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor:
            isDarkTheme ? const Color(0xFF0A4575) : const Color(0x60FFFFFF),
        selectedItemColor:
            isDarkTheme ? const Color(0xFFFACC1D) : const Color(0xFF0A4575),
        unselectedItemColor: Colors.blueGrey,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color:
              isDarkTheme ? const Color(0xFFF8F8F8) : const Color(0xFF242424),
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color:
              isDarkTheme ? const Color(0xFFFACC1D) : const Color(0xFF0A4575),
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color:
              isDarkTheme ? const Color(0xFFFACC1D) : const Color(0xFF0A4575),
        ),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
    );
  }
}
