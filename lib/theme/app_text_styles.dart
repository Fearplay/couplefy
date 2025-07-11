import 'package:flutter/material.dart';

/// Class for all text styles
class AppTextStyles {
  /// Returns the text style used for the names in input text field.
  ///
  /// The style includes:
  /// - Font size of 40 for readability
  /// - Bold font weight for emphasis
  static TextStyle nameTextField(BuildContext context) {
    return const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for displaying text inside a SnackBar.
  ///
  /// The style includes:
  /// - Text color based on the current theme's [onError] color,
  /// - Font size of 20 for readability
  /// - Bold font weight for emphasis
  static TextStyle snackBarNames(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onError,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the hint text in input text fields.
  ///
  /// The style includes:
  /// - Text color based on the current theme's [hintColor] color,
  /// - Bold font weight for emphasis
  static TextStyle hintText(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).hintColor,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the titles in homepage cards.
  ///
  /// The style includes:
  /// - Font size of 32 for readability
  /// - Bold font weight for emphasis
  static TextStyle titleHomePageText(BuildContext context) {
    return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the last texts in homepage cards.
  ///
  /// The style includes:
  /// - Font size of 28 for readability
  /// - Bold font weight for emphasis
  static TextStyle labelHomePageText(BuildContext context) {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the middle texts in homepage cards.
  ///
  /// The style includes:
  /// - Font size of 28 for readability
  static TextStyle middleHomePageText(BuildContext context) {
    return const TextStyle(
      fontSize: 28,
    );
  }

  /// Returns the text style used for the middle texts in holiday card.
  ///
  /// The style includes:
  /// - Font size of 22 for readability
  static TextStyle middleHolidayText(BuildContext context) {
    return const TextStyle(
      fontSize: 22,
    );
  }

  /// Returns the text style used for the title in love screen.
  ///
  /// The style includes:
  /// - Font size of 32 for readability
  /// - Font family Ubuntu
  static TextStyle loveScreenTitleText(BuildContext context) {
    return TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 32,
    );
  }

  /// Returns the text style used for texts in quote screen.
  ///
  /// The style includes:
  /// - Font size of 32 for readability
  /// - Font family BadScript
  static TextStyle quoteScreenText(BuildContext context) {
    return const TextStyle(
      fontSize: 32,
      fontFamily: 'BadScript',
    );
  }

  /// Returns the text style used for author text in quote screen.
  ///
  /// The style includes:
  /// - Font size of 28 for readability
  /// - Bold font weight for emphasis
  static TextStyle quoteScreenAuthor(BuildContext context) {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the middle text of quote in homepage card.
  ///
  /// The style includes:
  /// - Font size of 28 for readability
  /// - Font family BadScript
  static TextStyle quoteHomePageText(BuildContext context) {
    return const TextStyle(
      fontSize: 28,
      fontFamily: 'BadScript',
    );
  }

  /// Returns the text style used for the button texts.
  ///
  /// The style includes:
  /// - Text color based on the [white] color,
  /// - Font size of 20 for readability
  static TextStyle buttonText(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
  }

  /// Returns the text style used for the name day texts in the name day screen.
  ///
  /// The style includes:
  /// - Bold font weight for emphasis
  static TextStyle nameDayRow(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the current name day text.
  ///
  /// The style includes:
  /// - Text color based on the [black] color,
  /// - Bold font weight for emphasis
  static TextStyle todayNameDayRow(BuildContext context) {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  /// Returns the text style used for the info text in holiday card.
  ///
  /// The style includes:
  /// - Font size of 18 for readability
  static TextStyle holidayInfoText(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
    );
  }

  /// Returns the text style used for the options.
  ///
  /// The style includes:
  /// - Font size of 32 for readability
  static TextStyle optionsText(BuildContext context) {
    return TextStyle(
      fontSize: 32,
    );
  }
}
