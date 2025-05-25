import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_colors.dart';

/// dark theme settings
ThemeData appThemeDark = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    onPrimary: AppColors.onPrimaryDark,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.onSurfaceDark,
    secondaryContainer: AppColors.secondaryContainerDark,
    primaryFixed: AppColors.primaryFixedDark,
    secondaryFixed: AppColors.secondaryFixedDark,
    tertiary: AppColors.tertiaryDark,
    error: AppColors.errorDark,
    onError: AppColors.onErrorDark,
    surfaceTint: AppColors.surfaceDark,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.bottomNavigationColorDark,
    selectedItemColor: AppColors.selectedItemColorDark,
    unselectedItemColor: AppColors.unselectedItemColorDark,
  ),
  iconTheme: IconThemeData(
    color: AppColors.iconColorDark,
  ),
  hintColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.elevatedButtonColorDark,
    ),
  ),
);
