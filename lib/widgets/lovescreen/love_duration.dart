import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A widget that displays the duration of the relationship.
class LoveDuration extends StatelessWidget {
  /// Creates an instance of [LoveDuration].
  const LoveDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: DatePickerUtils.showOnlyDays,
      builder: (context, showOnlyDays, _) {
        // If user choose to show "only days" then this will show up
        if (showOnlyDays) {
          return Column(
            children: [
              Text(
                "${DatePickerUtils.daysTogether(context)}",
                style: AppTextStyles.labelHomePageText(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  Text(
                    DatePickerUtils.wholeDate()!,
                    style: AppTextStyles.labelHomePageText(context),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          );
        }
        // If user choose to not show "only days" then this will show up
        else {
          return Column(
            children: [
              // Row for year and month
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "${DatePickerUtils.yearsTogether(context)[0]}",
                    style: AppTextStyles.labelHomePageText(context),
                  ),
                  Text(
                    "${DatePickerUtils.yearsTogether(context)[1]}",
                    style: AppTextStyles.labelHomePageText(context),
                  ),
                ],
              ),
              // Row for week and day
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${DatePickerUtils.yearsTogether(context)[2]}",
                    style: AppTextStyles.labelHomePageText(context),
                  ),
                  Text(
                    "${DatePickerUtils.yearsTogether(context)[3]}",
                    style: AppTextStyles.labelHomePageText(context),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  // Text with today's date or with date which user picked
                  Text(
                    DatePickerUtils.wholeDate()!,
                    style: AppTextStyles.labelHomePageText(context),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          );
        }
      },
    );
  }
}
