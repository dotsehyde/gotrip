import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Color primaryColor = const Color(0xFF6C19D8);
Color secondaryColor = const Color(0xFF6C19D8);
Color xGrey = const Color(0xFF848484);

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: primaryColor,
  textTheme: TextTheme(
    headline6: GoogleFonts.poppins(
      fontSize: 20.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 16.sp,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: primaryColor,
  textTheme: TextTheme(
    headline6: GoogleFonts.poppins(
      fontSize: 20.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 16.sp,
    ),
  ),
);
