import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/utils/widget_theme/app_text_field_theme.dart';
import 'package:be_safe/utils/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.baseColor,
    brightness: Brightness.light,
    textTheme: AppTextThemes.lightTextTheme,
    scaffoldBackgroundColor: AppColors.bgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bgColor,
    ),
    inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,

    /*
      elevatedButtonTheme: AppEvaluatedButtonThemes.lightEvaluatedButtonTheme,
      inputDecorationTheme:AppTextFieldTheme.lightInputDecorationTheme*/
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextThemes.darkTextTheme,
    scaffoldBackgroundColor: AppColors.blackColor,
    inputDecorationTheme:AppTextFieldTheme.darkInputDecorationTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackColor,
    ),

    /*outlinedButtonTheme: AppOutlineButtonThemes.darkOutlineButtonTheme,
      elevatedButtonTheme: AppEvaluatedButtonThemes.darkEvaluatedButtonTheme,
      */
  );
}
