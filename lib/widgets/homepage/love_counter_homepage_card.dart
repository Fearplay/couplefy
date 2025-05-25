import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/widgets/lovescreen/love_duration.dart';
import 'package:couplefy/widgets/lovescreen/names_together.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// A widget that displays the first homepage card about love.
class LoveCounterHomepageCard extends StatelessWidget {
  /// Creates an instance of [LoveCounterHomepageCard].
  ///  Parameters:
  /// - [gradientColor]: The colors in [List].
  const LoveCounterHomepageCard(this.gradientColor, {super.key});

  final List<Color> gradientColor;

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
            Icons.favorite,
            size: 50,
          ),
          Text(
            AppLocalizations.of(context)!.loveCounterHomePageTitle,
            style: AppTextStyles.titleHomePageText(context),
          ),
          NamesTogether(
            AppTextStyles.middleHomePageText(context),
          ),
          LoveDuration(),
        ],
      ),
    );
  }
}
