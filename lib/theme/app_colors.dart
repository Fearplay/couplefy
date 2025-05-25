import 'package:flutter/material.dart';

/// Class for all colors
class AppColors {
// ────────────────────────────────────────────────────────────────
//                      LIGHT MODE COLORS
// ────────────────────────────────────────────────────────────────

  /// Primary color (for example date picker) for light mode.
  static const Color primaryLight = Colors.purple;

  /// Primary color (for example text in date picker) for light mode.
  static const Color onPrimaryLight = Colors.white;

  /// Background color of whole app for light mode
  static const Color surfaceLight = Color.fromARGB(255, 255, 233, 227);

  /// Text color on the background for light mode
  static const Color onSurfaceLight = Colors.black87;

  /// TextField fill color for light mode.
  static Color secondaryContainerLight = Colors.grey.shade200;

  /// Gradient color used for cards on the Home Page and containers on the Name Day screen for light mode.
  static Color primaryFixedLight = Color(0xFFE6E6FA);

  /// Gradient color used for cards on the Home Page and containers on the Name Day screen for light mode.
  static Color secondaryFixedLight = Color(0xFFDDA0DD);

  /// SnackBar not success color for light mode.
  static Color errorLight = Colors.red.shade900;

  /// SnackBar success color for light mode.
  static Color tertiaryLight = Colors.green;

  /// Text color when display on Error message for light mode.
  static const Color onErrorLight = Colors.white;

  /// Surface Tin color to not be able change color while scroll for light mode.
  static const Color surfaceTintLight = Colors.transparent;

  /// Selected item color in navigation for light mode.
  static const Color selectedItemColorLight = Colors.white;

  /// Unselected item color in navigation for light mode.
  static const Color unselectedItemColorLight = Colors.white;

  /// Icon color for light mode.
  static const Color iconColorLight = Color(0xFF009688);

  /// Elevated button color for light mode.
  static const Color elevatedButtonColorLight = Color(0xFF5C6BC0);

  /// Bottom navigation color for light mode.
  static const Color bottomNavigationColorLight = Color(0xFF8E24AA);

// ────────────────────────────────────────────────────────────────
//                     DARK MODE COLORS
// ────────────────────────────────────────────────────────────────

  /// Primary color (for example date picker) for dark mode.
  static const Color primaryDark = Colors.pinkAccent;

  /// Primary color (for example text in date picker) for dark mode.
  static const Color onPrimaryDark = Colors.white;

  /// Background color of whole app for dark mode
  static const Color surfaceDark = Color(0xFF121212);

  /// Text color on the background for light mode
  static const Color onSurfaceDark = Colors.white;

  /// TextField fill color for dark mode.
  static const Color secondaryContainerDark = Color(0xFF1E1E2F);

  /// Gradient color used for cards on the Home Page and containers on the Name Day screen for dark mode.
  static Color primaryFixedDark = Color(0xFF2A2A72);

  /// Gradient color used for cards on the Home Page and containers on the Name Day screen for dark mode.
  static Color secondaryFixedDark = Color(0xFF9D4EDD);

  /// SnackBar not success color for dark mode.
  static Color errorDark = Colors.red.shade900;

  /// SnackBar success color for dark mode.
  static Color tertiaryDark = Colors.greenAccent.shade700;

  /// Text color when display on Error message for dark mode.
  static const Color onErrorDark = Colors.white;

  /// Surface Tin color to not be able change color while scroll for dark mode.
  static const Color surfaceTintDark = Colors.transparent;

  /// Selected item color in navigation for dark mode.
  static const Color selectedItemColorDark = Colors.white;

  /// Unselected item color in navigation for dark mode.
  static const Color unselectedItemColorDark = Colors.white;

  /// Icon color for dark mode.
  static const Color iconColorDark = Color(0xFFF06292);

  /// Elevated button color for dark mode.
  static const Color elevatedButtonColorDark = Color(0xFFC2185B);

  /// Bottom navigation color for dark mode.
  static const Color bottomNavigationColorDark = Color(0xFF303F9F);

// ────────────────────────────────────────────────────────────────
//                       NO MODE COLORS
// ────────────────────────────────────────────────────────────────

  /// Color for switch button active color.
  static const Color switchActiveColor = Colors.white;

  /// Color for switch button inactive thumb color.
  static Color switchInactiveThumbColor = Colors.grey.shade300;

  /// Color for switch button active track color.
  static Color switchActiveTrackColor = Colors.purpleAccent.shade100;

  /// Color for switch button inactive track color.
  static Color switchInactiveTrackColor = Colors.grey.shade600;

  /// Gradient color for today.
  static const Color firstTodayMarkColor = Color(0xFFFFA726);

  /// Gradient color for today.
  static const Color secondTodayMarkColor = Color(0xFFFF7043);
}
