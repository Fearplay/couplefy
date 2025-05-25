import 'package:flutter/material.dart';
import 'package:couplefy/widgets/homepage/love_counter_homepage_card.dart';
import 'package:couplefy/widgets/homepage/quote_homepage_card.dart';
import 'package:couplefy/widgets/homepage/name_day_homepage_card.dart';

/// A widget that displays the main homepage cards in a vertical layout.
///
/// Includes:
/// - Love counter card
/// - Daily quote card
/// - Name day card
///
/// Each card shares a common gradient background defined by
/// [primaryFixed] and [secondaryFixed] colors from the current theme.
class HomepageCard extends StatelessWidget {
  /// Creates an instance of [HomepageCard].
  const HomepageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      Theme.of(context).colorScheme.primaryFixed,
      Theme.of(context).colorScheme.secondaryFixed,
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoveCounterHomepageCard(gradientColors),
        QuoteHomepageCard(gradientColors),
        NameDayHomepageCard(gradientColors),
      ],
    );
  }
}
