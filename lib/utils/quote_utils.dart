import 'dart:ffi';
import 'dart:math';
import 'package:couplefy/data/quotes.dart';
import 'package:couplefy/models/quotes_model.dart';

class QuoteUtils {
  static String? currentQuoteText;
  static String? currentQuoteAuthor;

  static void getAndSaveQuotes() {
    int randomIndex = Random().nextInt(quotes.length);
    currentQuoteText = quotes[randomIndex].text;
    currentQuoteAuthor = quotes[randomIndex].authorName;
  }

  String getQuoteText() {
    return quotes[0].text;
  }

  String getQuoteAuthor() {
    return quotes[0].authorName;
  }


}
