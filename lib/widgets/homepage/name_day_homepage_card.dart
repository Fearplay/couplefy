import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/data/name_day.dart';
import 'package:couplefy/theme/app_text_styles.dart';

/// A widget that displays the third homepage card about name day.
class NameDayHomepageCard extends StatelessWidget {
  /// Creates an instance of [NameDayHomepageCard].
  ///  Parameters:
  /// - [gradientColor]: The colors in [List].
  const NameDayHomepageCard(this.gradientColor, {super.key});

  final List<Color> gradientColor;

  @override
  Widget build(BuildContext context) {
    // Get today's name day based on current day and month
    final dayOfToday = nameDays.firstWhere(
      (name) => name.date.month == DateTime.now().month && name.date.day == DateTime.now().day,
    );
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
            Icons.calendar_today,
            size: 50,
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.nameDayHomePageTitle,
            style: AppTextStyles.titleHomePageText(context),
          ),
          // Text to display today's date with zero for example 25.05.
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.nameDayHomePage(
              dayOfToday.date.day.toString().padLeft(2, '0'),
              dayOfToday.date.month.toString().padLeft(2, '0'),
            ),
            style: AppTextStyles.middleHomePageText(context),
          ),
          // Text to display which name is celebrating name day for that day
          Text(
            dayOfToday.name,
            style: AppTextStyles.labelHomePageText(context),
          )
        ],
      ),
    );
  }
}
