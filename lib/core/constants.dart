// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//App configs
const String SUPABASE_URL = "https://iegluyyedgymrfxldclb.supabase.co";
const String SUPABASE_ANNON_KEY =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImllZ2x1eXllZGd5bXJmeGxkY2xiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzEzMDM0NTMsImV4cCI6MTk4Njg3OTQ1M30.T8-s67mcndfoNV-Q2XVJ5ofs1KCTnn8gCGM2PrtYs7I";

Color primaryColor = const Color(0xFF674DEE);
Color secondaryColor = const Color(0xFF6C19D8);
Color xGrey = const Color(0xFF848484);

ThemeData lightTheme = ThemeData.light(
).copyWith(
  primaryColor: primaryColor,
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    headline6: GoogleFonts.poppins(
      fontSize: 20.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 16.sp,
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData.dark(
).copyWith(
  primaryColor: primaryColor,
  backgroundColor: Colors.black,
  textTheme: TextTheme(
    headline6: GoogleFonts.poppins(
      fontSize: 20.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 16.sp,
      color: Colors.white,
    ),
  ),
);
