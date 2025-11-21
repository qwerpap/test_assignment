import 'package:flutter/material.dart';
import 'app_colors.dart';

final lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    surface: AppColors.lightSurfaceColor,
    onSurface: AppColors.blackColor,
    error: AppColors.errorColor,
  ),
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.lightBackgroundColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.blackColor),
    titleTextStyle: TextStyle(
      color: AppColors.blackColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final darkTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryColor,
    surface: AppColors.surfaceColor,
    onSurface: AppColors.whiteColor,
    error: AppColors.errorColor,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.backgroundColor,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.whiteColor),
    titleTextStyle: TextStyle(
      color: AppColors.whiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
);
