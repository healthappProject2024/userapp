import 'package:flutter/material.dart';
import 'package:userapp/config/theme/text_theme.dart';
import 'package:userapp/utils/const/app_colors.dart/my_colors.dart';

class Darktheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.darkColor,
    indicatorColor: MyColors.textfieldDarktMode,
    cardColor: MyColors.formbgColorDark,
    highlightColor: MyColors.whiteColor,
    iconTheme: IconThemeData(
      color: MyColors.hintTextColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.darkColor,
      iconTheme: IconThemeData(
        color: MyColors.hintTextColor,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextTheme.textTheme.headlineLarge?.copyWith(color: MyColors.whiteColor),
      headlineMedium: AppTextTheme.textTheme.headlineMedium,
            headlineSmall: AppTextTheme.textTheme.headlineSmall?.copyWith(color: MyColors.whiteColor),
      labelMedium: AppTextTheme.textTheme.labelMedium,
      labelSmall: AppTextTheme.textTheme.labelSmall,
      bodyMedium: AppTextTheme.textTheme.labelSmall?.copyWith(color: MyColors.whiteColor),
    ),
  );
}
