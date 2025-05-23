import 'dart:ffi';

import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/app.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DatePickerUtils {
  static String? loveDate;
  static final ValueNotifier<bool> showOnlyDays = ValueNotifier<bool>(true);
  static DateTime? saveLoveDate;
  static final DateTime todayDate = DateTime.now();

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
        initialDate:
            loveDate == null ? DateTime.now() : DateTime.parse(loveDate!));
  }

  static DateTime initialDateShowPicker() {
    if (loveDate == null) {
      return DateTime.now();
    }
    return DateTime.parse(loveDate!);
  }

  static String? makeEuropeDate(dynamic date) {
    List<String> parts = date.toString().split(" ");
    List<String> dateParts = parts[0].split("-");
    return "${dateParts[2]}/${dateParts[1]}/${dateParts[0]}";
  }

  static int saveDate(DateTime saveLove) {
    return saveLove.millisecondsSinceEpoch;
  }

  static String? saveDatetoDate(int timestamp) {
    return makeEuropeDate(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

  static String? wholeDate() {
    // List<String> parts = DateTime.now().toString().split(" ");
    // List<String> dateParts = parts[0].split("-");
    if (loveDate != null) {
      return makeEuropeDate(loveDate);
    }
    return makeEuropeDate(DateTime.now());
    // return DateTime.now().toString().split(" ")[0];
  }

  static int differenceDays() {
    if (loveDate != null) {
      DateTime today = DateTime.now();

      DateTime startDate = DateTime.parse(loveDate!);
      int differenceInDays = today.difference(startDate).inDays;
      return differenceInDays;
    }
    return 0;
  }

  static String? startFromZero(BuildContext context, int number) {
    if (loveDate != null) {
      return AppLocalizations.of(context)!.daysText(differenceDays() + number);
      // return differenceDays() == 1
      //     ? "${differenceDays().toString()} day Together"
      //     : "${differenceDays().toString()} days Together";
    }
    return AppLocalizations.of(context)!.daysText(0);
  }

  static String? daysTogether(BuildContext context) {
    if (SharedPreferencesUtils.startFromZero.value == true) {
      // if (loveDate != null) {
      //   return AppLocalizations.of(context)!.daysText(differenceDays());
      //   // return differenceDays() == 1
      //   //     ? "${differenceDays().toString()} day Together"
      //   //     : "${differenceDays().toString()} days Together";
      // }
      // return AppLocalizations.of(context)!.daysText(0);
      return startFromZero(context, 0);
    } else {
      // if (loveDate != null) {
      //   return AppLocalizations.of(context)!.daysText(differenceDays() + 1);
      //   // return differenceDays() == 1
      //   //     ? "${differenceDays().toString()} day Together"
      //   //     : "${differenceDays().toString()} days Together";
      // }
      // return AppLocalizations.of(context)!.daysText(0);
      return startFromZero(context, 1);
    }
  }

  static int _daysToYears() {
    int? days = differenceDays();
    double year = days / 365.25;

    return year.floor();
  }

  static List<dynamic> _daysToMonths() {
    double daysAfterYear = differenceDays()! - (_daysToYears() * 365.25);

    double month = daysAfterYear / 30.44;

    return [daysAfterYear, month.floor()];
  }

  static List<dynamic> _daysToWeeks() {
    double daysAfterMonth = _daysToMonths()[0] - (_daysToMonths()[1] * 30.44);

    double week = daysAfterMonth / 7;
    // print(week.floor());
    // print(week);
    // print(_daysToMonths()[0]);
    // print((_daysToMonths()[1] * 30.44));
    return [daysAfterMonth, week.floor()];
  }

  static int _daysToDays() {
    double daysAfterWeek = _daysToWeeks()[0] - (_daysToWeeks()[1] * 7);

    // String inString = daysAfterWeek.toStringAsFixed(0);
    // int inDouble = int.parse(inString);
    return daysAfterWeek.floor();
  }

//   static String formatPluralEnglish(int number, String englishSingular, String englishPlural) {
//     return "$number ${number == 1 ? englishSingular : englishPlural}";
//   }
//
//
// static String formatPluralCzech(int count, String czechSingular, String czechFew, String czechPlural) {
//   if (count == 1) {
//     return "$count $czechSingular";
//   } else if (count >= 2 && count <= 4) {
//     return "$count $czechFew";
//   } else {
//     return "$count $czechPlural";
//   }
// }
// static String formatPluralAuto(int count, String englishSingular, String englishPlural, String czechSingular, String czechFew, String czechPlural) {
//   if (MyApp.language.toString() == "cs") {
//     return formatPluralCzech(count, czechSingular, czechFew, czechPlural);
//   } else {
//     return formatPluralEnglish(count, englishSingular, englishPlural);
//
//   }
// }
  static List<dynamic> _countOfYears() {
    final datePick = initialDateShowPicker();
    int years = todayDate.year - datePick.year;
    int months = todayDate.month - datePick.month;
    int days = todayDate.day - datePick.day;

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

  static List<dynamic> yearsTogether(BuildContext context) {
    if (loveDate != null) {
      return [
        AppLocalizations.of(context)!.yearsText(_countOfYears()[0]),
        AppLocalizations.of(context)!.monthsText(_countOfYears()[1]),
        AppLocalizations.of(context)!.weeksText(_countOfYears()[2]),
        AppLocalizations.of(context)!.daysText(_countOfYears()[3]),
        // formatPluralAuto(_daysToYears(), "year", "years", "rok", "roky", "roků"),
        // formatPluralAuto(_daysToMonths()[1], "month", "months", "měsíc", "měsíce", "měsíců"),
        // formatPluralAuto(_daysToWeeks()[1], "week", "weeks", "týden", "týdny", "týdnů"),
        // formatPluralAuto(_daysToDays(), "day", "days", "den", "dny", "dnů"),
      ];
      // return ["${_daysToYears()} years", "${_daysToMonths()[1]} months", "${_daysToWeeks()[1]} weeks", "${_daysToDays()} days"];
    }
    return [
      AppLocalizations.of(context)!.yearsText(0),
      AppLocalizations.of(context)!.monthsText(0),
      AppLocalizations.of(context)!.weeksText(0),
      AppLocalizations.of(context)!.daysText(0),
      // formatPluralAuto(0, "year", "years", "rok", "roky", "roků"),
      // formatPluralAuto(0, "month", "months", "měsíc", "měsíce", "měsíců"),
      // formatPluralAuto(0, "week", "weeks", "týden", "týdny", "týdnů"),
      // formatPluralAuto(0, "day", "days", "den", "dny", "dnů"),
    ];
  }
}
