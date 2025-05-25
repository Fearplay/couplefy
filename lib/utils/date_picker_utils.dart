import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class DatePickerUtils {
  static String? loveDate;
  static final ValueNotifier<bool> showOnlyDays = ValueNotifier<bool>(true);
  static DateTime? saveLoveDate;
  static final DateTime todayDate = DateTime.now();

  /// Displays a date picker dialog and returns the selected date.
  ///
  ///   Parameters:
  /// - [context]: The build context in which to show the dialog.
  ///
  /// Opens a modal date picker using [showDatePicker] with:
  /// - English locale.
  /// - Date range from 1900 to today.
  /// - A localized hint text from [AppLocalizations].
  /// - Initial date set to [loveDate] if available, otherwise today.
  ///
  /// Returns:
  /// - [DateTime]: If the user selects a date.
  /// - `null`: If the user cancels the picker.
  static Future<DateTime?> selectDate({
    required BuildContext context,
  }) async {
    return await showDatePicker(
        context: context,
        locale: const Locale('en'),
        keyboardType: TextInputType.text,
        fieldHintText: AppLocalizations.of(context)!.dateWriteHint,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: loveDate == null ? DateTime.now() : DateTime.parse(loveDate!));
  }

  /// Initialize a date picker dialog and returns the previous selected date or today's date.
  ///
  /// Returns:
  /// - [DateTime]: `picked date` if the user had selected a date before.
  /// - [DateTime]: `today's date` if the user picking the date for the first time.
  static DateTime initialDateShowPicker() {
    if (loveDate == null) {
      return DateTime.now();
    }
    return DateTime.parse(loveDate!);
  }

  /// Converts a date object to European date format (DD/MM/YYYY).
  ///
  /// Parameters:
  /// - [date]: Accepts any object (e.g., DateTime or String).
  ///
  /// Returns:
  /// - [String]: Converted date to european format.
  static String? makeEuropeDate(dynamic date) {
    List<String> parts = date.toString().split(" ");
    List<String> dateParts = parts[0].split("-");
    return "${dateParts[2]}/${dateParts[1]}/${dateParts[0]}";
  }

  /// Converts a date object to European date format (DD/MM/YYYY).
  ///
  /// Returns:
  /// - [String]: The selected date in European format, if the user picked a date using [selectDate].
  /// - [String]: Converted today's date in European format.
  static String? wholeDate() {
    if (loveDate != null) {
      return makeEuropeDate(loveDate);
    }
    return makeEuropeDate(DateTime.now());
  }

  /// Converts a date object to European date format (DD/MM/YYYY).
  ///
  /// Returns:
  /// - A [int] containing the difference in days between chosen date of the user and today's date if the user picked a date using [selectDate].
  /// - A [int] with zero if the user didn't pick a date using [selectDate].
  static int differenceDays() {
    if (loveDate != null) {
      DateTime today = DateTime.now();

      DateTime startDate = DateTime.parse(loveDate!);
      int differenceInDays = today.difference(startDate).inDays;
      return differenceInDays;
    }
    return 0;
  }

  /// Add one day to days if user doesn't want to count from zero.
  ///
  ///   Parameters:
  /// - [context]: The build context for the [AppLocalizations].
  /// - [int]: Number for option count from zero
  ///
  /// Returns:
  /// - A [int]: The difference in days between chosen date of the user and today's date if the user picked a date using [selectDate].
  /// - A [int]: Zero if the user didn't pick a date using [selectDate].
  static String? startFromZero(BuildContext context, int number) {
    if (loveDate != null) {
      return AppLocalizations.of(context)!.daysText(differenceDays() + number);
    }
    return AppLocalizations.of(context)!.daysText(0);
  }

  /// Counts how long the couple has been together in `days`.
  ///
  ///   Parameters:
  /// - [context]: The build context for the [startFromZero].
  ///
  /// Returns:
  /// - A [String]: How long the couple has been together in days if the user has turned on the switch (indicating they want to count from day zero).
  /// - A [String]: How long the couple has been together in days if the user has turned off the switch (indicating they want to count from day one).
  static String? daysTogether(BuildContext context) {
    if (SharedPreferencesUtils.startFromZero.value == true) {
      return startFromZero(context, 0);
    } else {
      return startFromZero(context, 1);
    }
  }

  /// Counts how long the couple has been together in years, months, weeks, days.
  ///
  /// Returns:
  /// - A [List]: With [int] values `years`,`months`, `weeks`, `days`.
  static List<int> _countOfYears() {
    int days;
    final datePick = initialDateShowPicker();
    int years = todayDate.year - datePick.year;
    int months = todayDate.month - datePick.month;
    if (SharedPreferencesUtils.startFromZero.value == true) {
      days = todayDate.day - datePick.day;
    } else {
      days = todayDate.day - datePick.day + 1;
    }

    if (days < 0) {
      months -= 1;
      final prevMonth = DateTime(todayDate.year, todayDate.month, 0);
      days += prevMonth.day;
    }
    if (months < 0) {
      years -= 1;
      months += 12;
    }
    int weeks = days ~/ 7;
    days = days % 7;
    return [years, months, weeks, days];
  }

  /// Counts how long the couple has been together in `years`,`months`, `weeks`, `days`.
  ///
  ///   Parameters:
  /// - [context]: The build context for the [AppLocalizations].
  ///
  /// Returns:
  /// - A [List]: With `dynamic` values of how long the couple has been together in `years`,`months`, `weeks`, `days` if the user picked a date using [selectDate].
  /// - A [List]: With `dynamic` values of how long the couple has been together in `years`,`months`, `weeks`, `days` if the user didn't pick a date using [selectDate] (only zeros).
  static List<dynamic> yearsTogether(BuildContext context) {
    if (loveDate != null) {
      return [
        AppLocalizations.of(context)!.yearsText(_countOfYears()[0]),
        AppLocalizations.of(context)!.monthsText(_countOfYears()[1]),
        AppLocalizations.of(context)!.weeksText(_countOfYears()[2]),
        AppLocalizations.of(context)!.daysText(_countOfYears()[3]),
      ];
    }
    return [
      AppLocalizations.of(context)!.yearsText(0),
      AppLocalizations.of(context)!.monthsText(0),
      AppLocalizations.of(context)!.weeksText(0),
      AppLocalizations.of(context)!.daysText(0),
    ];
  }
}
