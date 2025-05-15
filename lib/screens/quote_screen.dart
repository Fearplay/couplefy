import 'dart:math';

import 'package:flutter/material.dart';
import 'package:couplefy/data/quotes.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/quote_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/utils/tab_name_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late String quoteText;
  late String quoteAuthor;

  @override
  void initState() {
    super.initState();
    quoteText = QuoteUtils.currentQuoteText ?? QuoteUtils().getQuoteText();
    quoteAuthor =
        QuoteUtils.currentQuoteAuthor ?? QuoteUtils().getQuoteAuthor();
  }

  void randomQuote() async {
    setState(() {
      QuoteUtils.getAndSaveQuotes();
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
        // TabNameUtils(AppLocalizations.of(context)!.quotesTabName),
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
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     TabNameUtils(AppLocalizations.of(context)!.quotesTabName),
    //     Expanded(
    //       child: Center(
    //         child: SingleChildScrollView(
    //           child: Padding(
    //             padding: const EdgeInsets.all(20.0),
    //             child: Column(
    //               children: [
    //                 Icon(
    //                   Icons.format_quote_sharp,
    //                   size: 50,
    //                 ),
    //                 Text(
    //                   quoteText,
    //                   style: TextStyle(
    //                     fontSize: 32,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 Text(
    //                   "- $quoteAuthor",
    //                   style: TextStyle(
    //                     fontSize: 28,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 ElevatedButton(
    //                   onPressed: randomQuote,
    //                   style: ElevatedButton.styleFrom(
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(8),
    //                     ),
    //                     backgroundColor: Colors.purple,
    //                   ),
    //                   child: Padding(
    //                     padding: const EdgeInsets.all(15.0),
    //                     child: Text(
    //                       AppLocalizations.of(context)!.quoteButton,
    //                       style: TextStyle(color: Colors.white, fontSize: 20),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
