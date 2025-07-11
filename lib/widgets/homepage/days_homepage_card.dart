import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/data/entry_days_data.dart';

import 'package:couplefy/theme/app_text_styles.dart';

/// A widget that displays the third homepage card about name day.
class DaysHomepageCard extends StatelessWidget {
  /// Creates an instance of [DaysHomepageCard].
  ///  Parameters:
  /// - [gradientColor]: The colors in [List].
  const DaysHomepageCard(this.gradientColor, this.savedLanguage, {super.key});

  final List<Color> gradientColor;
  final String? savedLanguage;

  @override
  Widget build(BuildContext context) {
    // Get today's name day based on current day and month
    final dayOfToday = dayEntries.firstWhere(
      (name) => name.date.month == DateTime.now().month && name.date.day == DateTime.now().day,
    );
    return ValueListenableBuilder<bool>(
      valueListenable: SharedPreferencesUtils.globalHolidays,
      builder: (context, globalHolidays, _) {
        if (globalHolidays) {
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
                  AppLocalizations.of(context)!.holidayHomePageTitle,
                  style: AppTextStyles.titleHomePageText(context),
                ),
                // Text to display today's date with zero for example 25.05.
                Text(
                  textAlign: TextAlign.center,
                  AppLocalizations.of(context)!.globalHolidaysHomePage(
                    dayOfToday.date.day.toString().padLeft(2, '0'),
                    dayOfToday.date.month.toString().padLeft(2, '0'),
                  ),
                  style: AppTextStyles.middleHolidayText(context),
                ),
                // Text to display which name is celebrating name day for that day

                Text(
                  textAlign: TextAlign.center,
                  dayOfToday.globalDay![savedLanguage].toString(),
                  style: AppTextStyles.labelHomePageText(context),
                ),
                if (dayOfToday.regionScope == "us") ...{
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.globalHolidaysHomePageInfoTextUs,
                    style: AppTextStyles.holidayInfoText(context),
                  ),
                  Icon(Icons.info)
                } else ...{
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context)!.globalHolidaysHomePageInfoTextWw,
                    style: AppTextStyles.holidayInfoText(context),
                  ),
                  Icon(Icons.info)
                }
              ],
            ),
          );
        }
        // If user choose to not show "only days" then this will show up
        else {
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
                  style: AppTextStyles.middleHolidayText(context),
                ),
                // Text to display which name is celebrating name day for that day
                Text(
                  dayOfToday.nameDays[savedLanguage].toString(),
                  style: AppTextStyles.labelHomePageText(context),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
