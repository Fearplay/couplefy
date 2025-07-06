import 'dart:io';
import 'package:flutter/material.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/love_counter_utils.dart';
import 'package:couplefy/utils/quote_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  /// Value notifier for "dark mode" switch button
  static final ValueNotifier<bool> darkMode = ValueNotifier<bool>(true);

  /// Value notifier for "dark mode" switch button
  static final ValueNotifier<bool> globalHolidays = ValueNotifier<bool>(true);

  /// Value notifier for "start from zero" switch button
  static final ValueNotifier<bool> startFromZero = ValueNotifier<bool>(true);

  /// Stores the user's selected image
  static File? userImage;

  /// Stores the selected value
  static String? selectedValue;

  /// Initializes the app settings by loading stored values from [SharedPreferences].
  ///
  /// Loads:
  /// - Names of the couple
  /// - Selected date (love date)
  /// - UI switches (dark mode, start from zero, only show days)
  /// - Saved quote text and author
  /// - User profile image path
  /// - Previously selected dropdown option
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    // Load names
    final savedNames = prefs.getStringList("loveNames");
    LoveCounterUtils.firstPersonName = savedNames?[0];
    LoveCounterUtils.secondPersonName = savedNames?[1];

    // Load date
    if (prefs.containsKey('savedLoveDate')) {
      int timestamp = prefs.getInt('savedLoveDate')!;
      DateTime savedDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DatePickerUtils.loveDate = savedDate.toString().split(" ")[0];
    }

    // Load switches
    DatePickerUtils.showOnlyDays.value = prefs.getBool('showOnlyDays') ?? true;
    darkMode.value = prefs.getBool('darkMode') ?? false;
    globalHolidays.value = prefs.getBool('globalHolidays') ?? true;
    startFromZero.value = prefs.getBool('startFromZero') ?? true;

    // Load quote
    final savedQuote = prefs.getStringList("generatedQuote");
    if (savedQuote != null && savedQuote.length == 2) {
      QuoteUtils.currentQuoteText = savedQuote[0];
      QuoteUtils.currentQuoteAuthor = savedQuote[1];
    } else {
      QuoteUtils.getQuote();
    }

    // Load user image
    final imagePath = prefs.getString("userImagePath");
    if (imagePath != null) {
      final imageFile = File(imagePath);
      final exists = await imageFile.exists();
      if (exists) {
        userImage = imageFile;
      }
    }
    // Load selected value
    selectedValue = prefs.getString("selectedOption");
  }

  /// Saves the couple's names to [SharedPreferences].
  ///
  /// [names] should be a list of two [String]: first and second person names.
  static Future<void> setNames(List<String> names) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("loveNames", names);
  }

  /// Saves the couple's date as a timestamp into [SharedPreferences].
  static Future<void> setLoveDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("savedLoveDate", date.millisecondsSinceEpoch);
  }

  /// Saves the file path of the user-selected image and updates [userImage].
  static Future<void> saveUserImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userImagePath", path);
    userImage = File(path);
  }

  /// Saves the "show only days" switch state.
  static Future<void> setShowOnlyDays(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("showOnlyDays", value);
  }

  /// Saves the "start from zero" switch state.
  static Future<void> setStartFromZero(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("startFromZero", value);
  }

  /// Saves the "dark mode" switch state.
  static Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", value);
  }

  /// Saves the "international holidays" switch state.
  static Future<void> setGlobalHolidays(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("globalHolidays", value);
  }

  /// Saves a quote's text and author to [SharedPreferences].
  static Future<void> setQuote(String text, String author) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("generatedQuote", [text, author]);
  }

  /// Saves a selected value from a dropdown with languages
  static Future<void> saveSelectedValue(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectedOption", value);
  }
}
