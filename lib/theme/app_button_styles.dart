import 'package:flutter/material.dart';

class AppButtonStyles {
  static ButtonStyle allButtons(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
    static ButtonStyle aboutButton(BuildContext context) {
    return TextButton.styleFrom(
      padding: EdgeInsets.zero,
      splashFactory: NoSplash.splashFactory,
    );
  }
}
