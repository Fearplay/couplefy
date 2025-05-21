import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_colors.dart';

ThemeData appThemeLight = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primaryLight,
    onPrimary: AppColors.onPrimaryLight,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.onSurfaceLight,
    primaryContainer: AppColors.primaryContainerLight,
    secondaryContainer: AppColors.secondaryContainerLight,
    primaryFixed: AppColors.primaryFixedLight,
    secondaryFixed: AppColors.secondaryFixedLight,
    tertiary: AppColors.tertiaryLight,
    error: AppColors.errorLight,
    onError: AppColors.onErrorLight,
    surfaceTint: AppColors.surfaceTintLight,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavigationColorLight,
      selectedItemColor: AppColors.selectedItemColorLight,
      unselectedItemColor: AppColors.unselectedItemColorLight),
  cardColor: Colors.white,
  iconTheme: IconThemeData(color: AppColors.iconColorLight),
  hintColor: Colors.black,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.elevatedButtonColorLight),
  ),

  /* light theme settings */
);
