import 'dart:math';
import 'package:couplefy/data/quotes.dart';

class QuoteUtils {
  /// Current quote text
  static String? currentQuoteText;

  /// Current quote author
  static String? currentQuoteAuthor;

  /// Get quote. Takes random number of `quotes.length` and choose random quote from [quotes] based on that random number.
  static void getQuote() {
    int randomIndex = Random().nextInt(quotes.length);
    currentQuoteText = quotes[randomIndex].text;
    currentQuoteAuthor = quotes[randomIndex].authorName;
  }

  /// Get text of the quote (fallback only)
  String getQuoteText() {
    return quotes[0].text;
  }

  /// Get author of the quote (fallback only)
  String getQuoteAuthor() {
    return quotes[0].authorName;
  }
}
