import 'package:flutter/material.dart';

/// Class for all button styles
class AppButtonStyles {
  /// Style for elevated buttons
  ///
  /// - [borderRadius]: [BorderRadius.circular(8)]
  static ButtonStyle allButtons(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// Style for text buttons
  ///
  /// - [padding]: [EdgeInsets.zero]
  /// - [splashFactory]: [NoSplash.splashFactory]
  static ButtonStyle textButton(BuildContext context) {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      splashFactory: NoSplash.splashFactory,
    );
  }
}
