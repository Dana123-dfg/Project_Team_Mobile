import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryOrange = Color(
    0xFFFFAB6D,
  ); 
  static const Color lightOrange = Color(0xFFFFDAB9);
  static const Color background = Color(
    0xFFFFF5E1,
  ); 
  static const Color cardWhite = Colors.white;
  static const Color textBlack = Color(0xFF333333);
  static const Color iconBg = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static TextStyle get headline => GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get sectionTitle => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle get categoryLabel => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle get cardTitle => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle get foodTitle => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle get foodDescription =>
      GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]);

  static TextStyle get price => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle get seeAll => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFFFF6B00),
  );
}
