import 'package:couplefy/models/day_entry_model.dart';
import 'package:couplefy/screens/name_day_screen.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/models/name_day_model.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';

/// A widget that displays the container with name and date in the [NameDayScreen].
class NameDayRow extends StatelessWidget {
  /// Creates an instance of [NameDayRow].
  ///
  ///   Parameters:
  /// - [nameDayModel]: The name day model as [List].
  const NameDayRow(this.dayEntryModel, this.savedLanguage, {super.key});

  // final NameDayModel nameDayModel;
  final DayEntryModel dayEntryModel;
  final String? savedLanguage;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: SharedPreferencesUtils.globalHolidays,
      builder: (context, globalHolidays, _) {
        // If user choose to show "only days" then this will show up
        if (globalHolidays) {
          // If the day is current day. Then this happen:
          if (DatePickerUtils.todayDate.day == dayEntryModel.date.day && DatePickerUtils.todayDate.month == dayEntryModel.date.month) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Only different colors.
                  colors: [
                    AppColors.firstTodayMarkColor,
                    AppColors.secondTodayMarkColor,
                  ],
                ),
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dayEntryModel.internationalDay![savedLanguage].toString(),
                        style: AppTextStyles.todayNameDayRow(context),
                      ),
                      Text(
                        "${dayEntryModel.date.day.toString().padLeft(2, '0')}.${dayEntryModel.date.month.toString().padLeft(2, '0')}",
                        style: AppTextStyles.todayNameDayRow(context),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          // If the day is not current day. Then this happen:
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Only different colors
                colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dayEntryModel.internationalDay![savedLanguage].toString(),
                      style: AppTextStyles.nameDayRow(context),
                    ),
                    Text(
                      "${dayEntryModel.date.day.toString().padLeft(2, '0')}.${dayEntryModel.date.month.toString().padLeft(2, '0')}",
                      style: AppTextStyles.nameDayRow(context),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        // If user choose to not show "only days" then this will show up
        else {
          // If the day is current day. Then this happen:
          if (DatePickerUtils.todayDate.day == dayEntryModel.date.day && DatePickerUtils.todayDate.month == dayEntryModel.date.month) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // Only different colors.
                  colors: [
                    AppColors.firstTodayMarkColor,
                    AppColors.secondTodayMarkColor,
                  ],
                ),
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dayEntryModel.nameDays[savedLanguage].toString(),
                        style: AppTextStyles.todayNameDayRow(context),
                      ),
                      Text(
                        "${dayEntryModel.date.day.toString().padLeft(2, '0')}.${dayEntryModel.date.month.toString().padLeft(2, '0')}",
                        style: AppTextStyles.todayNameDayRow(context),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          // If the day is not current day. Then this happen:
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Only different colors
                colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dayEntryModel.nameDays[savedLanguage].toString(),
                      style: AppTextStyles.nameDayRow(context),
                    ),
                    Text(
                      "${dayEntryModel.date.day.toString().padLeft(2, '0')}.${dayEntryModel.date.month.toString().padLeft(2, '0')}",
                      style: AppTextStyles.nameDayRow(context),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      }
    );

  }
}
