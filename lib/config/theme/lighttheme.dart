import 'package:flutter/material.dart';
import 'package:userapp/config/theme/text_theme.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class Lighttheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.whiteColor,
    indicatorColor: MyColors.textfieldLightMode,
    cardColor: MyColors.whiteColor,
    highlightColor: MyColors.blackColor,
    iconTheme: IconThemeData(
      color: MyColors.hintTextColor,
    ),
        appBarTheme: AppBarTheme(
      backgroundColor: MyColors.whiteColor,
      iconTheme: IconThemeData(
        color: MyColors.hintTextColor,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextTheme.textTheme.headlineLarge?.copyWith(
        color: MyColors.blackColor,
      ),
      headlineMedium: AppTextTheme.textTheme.headlineMedium,
      labelSmall: AppTextTheme.textTheme.labelSmall,
      bodyMedium: AppTextTheme.textTheme.labelSmall?.copyWith(
        color: MyColors.blackColor,
      ),
    ),
  );
}
