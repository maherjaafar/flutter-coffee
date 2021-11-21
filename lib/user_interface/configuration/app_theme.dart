import 'package:flutter/material.dart';
import 'package:flutter_coffee/user_interface/configuration/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.lightBodyText,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.lightBodyText,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: AppColors.lightBodyText,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.lightBodyText,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.lightBodyText,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      textTheme: lightTextTheme,
    );
  }
}
