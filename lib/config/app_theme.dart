import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      textTheme: GoogleFonts.jersey10TextTheme(ThemeData.dark().textTheme),
      brightness: Brightness.dark,
    );
  }

  static TextStyle brandTextStyle({required bool isMobile, Color? color}) {
    return GoogleFonts.jersey10(
      color: color ?? AppColors.brandColor,
      fontSize: isMobile ? 35 : 50,
      letterSpacing: 2,
    );
  }

  static TextStyle navTextStyle({bool isMobile = false, Color? color}) {
    return GoogleFonts.jersey10(
      color: color ?? AppColors.primaryText,
      fontSize: isMobile ? 16 : 18,
      letterSpacing: 1,
    );
  }

  static TextStyle headingStyle({bool isMobile = false, Color? color}) {
    return GoogleFonts.jersey10(
      fontSize: isMobile ? 32 : 48,
      color: color ?? AppColors.primaryText,
      letterSpacing: 2,
    );
  }

  static TextStyle bodyTextStyle({bool isMobile = false, Color? color}) {
    return GoogleFonts.jersey10(
      fontSize: isMobile ? 16 : 18,
      color: color ?? AppColors.secondaryText,
      height: 1.6,
    );
  }
}
