import 'package:flutter/material.dart';
import 'app_colors.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle tabName(BuildContext context) {
    return const TextStyle(
      // color: Theme.of(context).colorScheme.onSurface,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle nameTextField(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 40,
    );
  }

  static TextStyle snackBarNames(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onError,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle hintText(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).hintColor,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle titleHomePageText(BuildContext context) {
    return const TextStyle(
      // color: Theme.of(context).colorScheme.onPrimary,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle labelHomePageText(BuildContext context) {
    return const TextStyle(
      // color: Theme.of(context).colorScheme.onPrimary,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle middleHomePageText(BuildContext context) {
    return const TextStyle(
      // color: Theme.of(context).colorScheme.onPrimary,
      fontSize: 28,

      // fontWeight: FontWeight.bold,
    );
  }

  static TextStyle loveScreenTitleText(BuildContext context) {
    return TextStyle(
      // color: Theme.of(context).colorScheme.onPrimary,
      fontFamily: 'Ubuntu',
      fontSize: 32,

      // fontWeight: FontWeight.bold,
    );
  }

  static TextStyle quoteScreenText(BuildContext context) {
    return const TextStyle(
      fontFamily: 'BadScript',
      fontSize: 32,
    );
  }

  static TextStyle quoteScreenAuthor(BuildContext context) {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle quoteHomePageText(BuildContext context) {
    return const TextStyle(
      fontSize: 28,
      fontFamily: 'BadScript',
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
  }

  static TextStyle nameDayRow(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      // fontSize: 15
    );
  }

  static TextStyle todayNameDayRow(BuildContext context) {
    return const TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black,
      // fontSize: 15
    );
  }

  static TextStyle optionsText(BuildContext context) {
    return TextStyle(
      fontSize: 32,
    );
    // return GoogleFonts.paytoneOne(
    //   textStyle: TextStyle(
    //     fontSize: 32,
    //   ),
    // );
  }
}
