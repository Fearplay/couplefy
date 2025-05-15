import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/data/name_day.dart';
import 'package:couplefy/theme/app_text_styles.dart';

class NameDayHomepageCard extends StatelessWidget {
  const NameDayHomepageCard(this.gradientColor, {super.key});

  final List<Color> gradientColor;

  @override
  Widget build(BuildContext context) {
    final result = nameDays.firstWhere((name) =>
        name.date.month == DateTime.now().month &&
        name.date.day == DateTime.now().day);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColor, begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Icon(
            Icons.calendar_today,
            size: 50,
            // color: Colors.purple,
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.nameDayHomePageTitle,
            style: AppTextStyles.titleHomePageText(context),
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.nameDayHomePage(
                result.date.day.toString().padLeft(2, '0'),
                result.date.month.toString().padLeft(2, '0')),
            style: AppTextStyles.middleHomePageText(context),
          ),
          Text(
            result.name,
            style: AppTextStyles.labelHomePageText(context),
          )
          // NamesTogether(),
          // LoveDuration(),
        ],
      ),
    );
  }
}
