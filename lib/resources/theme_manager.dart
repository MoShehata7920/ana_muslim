import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFFEEE7DF);
  static const Color blackColor = Color(0xFF141A2E);
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true, color: Colors.transparent, elevation: 0.0),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF242424),
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF242424),
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF242424),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
  static ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true, color: Colors.transparent, elevation: 0.0),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFF8F8F8),
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFFACC1D),
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: const Color(0xFFFACC1D),
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: blackColor,
        selectedItemColor: Color(0xFFFACC1D),
        unselectedItemColor: Colors.white,
      ));
}
