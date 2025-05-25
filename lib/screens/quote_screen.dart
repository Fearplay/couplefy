import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/quote_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Quote Screen (in app fourth position)
class QuoteScreen extends StatefulWidget {
  /// Creates an instance of [QuoteScreen].
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late String quoteText;
  late String quoteAuthor;

  /// Initializes the quote text and author.
  /// Uses a cached quote if available; otherwise, retrieves a new one.
  @override
  void initState() {
    super.initState();
    quoteText = QuoteUtils.currentQuoteText ?? QuoteUtils().getQuoteText();
    quoteAuthor = QuoteUtils.currentQuoteAuthor ?? QuoteUtils().getQuoteAuthor();
  }

  /// Loads a new random quote and updates the state.
  ///
  /// - Fetches and saves quotes via [QuoteUtils].
  /// - Updates `quoteText` and `quoteAuthor`.
  /// - Saves selected quote using [SharedPreferencesUtils].
  void randomQuote() async {
    setState(() {
      QuoteUtils.getQuote();
      quoteText = QuoteUtils.currentQuoteText!;
      quoteAuthor = QuoteUtils.currentQuoteAuthor!;
    });
    await SharedPreferencesUtils.setQuote(quoteText, quoteAuthor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.format_quote_sharp,
                      size: 50,
                    ),
                    Text(
                      quoteText,
                      style: AppTextStyles.quoteScreenText(context),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "- $quoteAuthor",
                      style: AppTextStyles.quoteScreenAuthor(context),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      // Generate random quote
                      onPressed: randomQuote,
                      style: AppButtonStyles.allButtons(context),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          AppLocalizations.of(context)!.quoteButton,
                          style: AppTextStyles.buttonText(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
