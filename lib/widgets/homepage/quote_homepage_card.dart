import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/quote_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// A widget that displays the second homepage card about quote.
class QuoteHomepageCard extends StatelessWidget {
  /// Creates an instance of [QuoteHomepageCard].
  ///  Parameters:
  /// - [gradientColor]: The colors in [List].
  QuoteHomepageCard(this.gradientColor, {super.key});

  final List<Color> gradientColor;

  final String quoteText = QuoteUtils.currentQuoteText ?? QuoteUtils().getQuoteText();

  final String quoteAuthor = QuoteUtils.currentQuoteAuthor ?? QuoteUtils().getQuoteAuthor();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            Icons.format_quote_sharp,
            size: 50,
          ),
          Text(
            AppLocalizations.of(context)!.quoteHomePageTitle,
            style: AppTextStyles.titleHomePageText(context),
          ),
          Text(
            quoteText,
            textAlign: TextAlign.center,
            style: AppTextStyles.quoteHomePageText(context),
          ),
          Text(
            "- $quoteAuthor",
            textAlign: TextAlign.center,
            style: AppTextStyles.labelHomePageText(context),
          ),
        ],
      ),
    );
  }
}
