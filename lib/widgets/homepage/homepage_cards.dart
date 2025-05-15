import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/widgets/homepage/love_counter_homepage_card.dart';
import 'package:couplefy/widgets/homepage/quote_homepage_card.dart';
import 'package:couplefy/widgets/homepage/name_day_homepage_card.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color>gradientColors = [Theme.of(context).colorScheme.primaryFixed, Theme.of(context).colorScheme.secondaryFixed];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LoveCounterHomepageCard(gradientColors),
        QuoteHomepageCard(gradientColors),
        NameDayHomepageCard(gradientColors),
      ],
    );
  }
}
