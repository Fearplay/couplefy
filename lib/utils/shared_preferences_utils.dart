import 'dart:io';
import 'package:flutter/material.dart';

import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/love_counter_utils.dart';
import 'package:couplefy/utils/quote_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils{
  static final ValueNotifier<bool> darkMode = ValueNotifier<bool>(true);
  static File? userImage;
  static String? selectedValue;
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    // NAMES
    final savedNames = prefs.getStringList("loveNames");
    LoveCounterUtils.firstPersonName = savedNames?[0];
    LoveCounterUtils.secondPersonName = savedNames?[1];



    // DATE
    if (prefs.containsKey('savedLoveDate')) {
      int timestamp = prefs.getInt('savedLoveDate')!;
      DateTime savedDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DatePickerUtils.loveDate = savedDate.toString().split(" ")[0];
    }

    // SWITCH
    DatePickerUtils.showOnlyDays.value = prefs.getBool('showOnlyDays') ?? true;
    darkMode.value = prefs.getBool('darkMode') ?? false;


    // DatePickerUtils.showOnlyDays.value = prefs.getBool('showOnlyDays') ?? false;



    // QUOTE
    final savedQuote = prefs.getStringList("generatedQuote");
    if (savedQuote != null && savedQuote.length == 2) {
      QuoteUtils.currentQuoteText = savedQuote[0];
      QuoteUtils.currentQuoteAuthor = savedQuote[1];
    } else {
      QuoteUtils.getAndSaveQuotes(); // nebo fallback
    }


final imagePath = prefs.getString("userImagePath");
if (imagePath != null) {
  final imageFile = File(imagePath);
  final exists = await imageFile.exists();
  if (exists) {
    userImage = imageFile;
  }
}


    selectedValue =prefs.getString("selectedOption");

  }

  static Future<void> setNames(List<String> names) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList("loveNames", names);
}

static Future<void> setLoveDate(DateTime date) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("savedLoveDate", date.millisecondsSinceEpoch);
}

static Future<void> saveUserImagePath(String path) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("userImagePath", path);
  userImage = File(path);
}

static Future<void> setShowOnlyDays(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("showOnlyDays", value);
}

static Future<void> setDarkMode(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("darkMode", value);
}

static Future<void> setQuote(String text, String author) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList("generatedQuote", [text, author]);
}

static Future<void> saveSelectedValue(String value) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectedOption", value);
}


}