import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class AppTextTheme {
  static final TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 14.sp,
      color: MyColors.whiteColor,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 12.sp,
      color: MyColors.specialTextColor
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16.sp,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.sp,
      color: MyColors.whiteColor,
      fontWeight: FontWeight.w700,
    )
  );
}
