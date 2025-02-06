import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextThemes{
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: GoogleFonts.nunitoSans(),
    titleMedium: GoogleFonts.raleway(),
    displayLarge: GoogleFonts.raleway(fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.raleway(color: AppColors.textColor),
    headlineMedium: GoogleFonts.nunitoSans(),
    bodyLarge: GoogleFonts.nunitoSans(),
    bodyMedium: GoogleFonts.nunitoSans(),
    bodySmall: GoogleFonts.nunitoSans(),
  );
  static TextTheme darkTextTheme = TextTheme(
    titleLarge: GoogleFonts.nunitoSans(),
    titleMedium: GoogleFonts.raleway(),
    displayLarge: GoogleFonts.raleway(fontWeight: FontWeight.bold),
    headlineLarge: GoogleFonts.raleway(color: AppColors.whiteColor),
    headlineMedium: GoogleFonts.nunitoSans(),
    bodyLarge: GoogleFonts.nunitoSans(),
    bodyMedium: GoogleFonts.nunitoSans(),
    bodySmall: GoogleFonts.nunitoSans(),
  );
}