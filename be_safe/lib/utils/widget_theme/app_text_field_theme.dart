import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

class AppTextFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    prefixIconColor: AppColors.blackColor,
    labelStyle: const TextStyle(color: AppColors.bgGrayFont),
    filled: true,
    fillColor: AppColors.bgGray,
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bgGray,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bgGray,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bgGray,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    prefixIconColor: AppColors.whiteColor, // White for visibility on dark background
    labelStyle: const TextStyle(color: AppColors.whiteColor), // Lighter label color
    filled: true,
    fillColor: AppColors.bgGrayDark, // Dark background color for input field
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bgGrayDark, // Subtle gray for the border in dark mode
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bgGrayDark, // Subtle gray for enabled border
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.bgGrayDark, // White for focused border to stand out
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
