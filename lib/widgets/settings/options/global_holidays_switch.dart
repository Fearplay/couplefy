import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';

/// Widget which displays dark mode row.
class GlobalHolidaysSwitch extends StatefulWidget {
  /// Creates an instance of [GlobalHolidaysSwitch].
  const GlobalHolidaysSwitch({super.key});

  @override
  State<GlobalHolidaysSwitch> createState() => _GlobalHolidaysSwitchState();
}

class _GlobalHolidaysSwitchState extends State<GlobalHolidaysSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.internationalHolidaysText,
          style: AppTextStyles.optionsText(context),
        ),
        Switch(
          activeColor: AppColors.switchActiveColor,
          inactiveThumbColor: AppColors.switchInactiveThumbColor,
          activeTrackColor: AppColors.switchActiveTrackColor,
          inactiveTrackColor: AppColors.switchInactiveTrackColor,
          value: SharedPreferencesUtils.globalHolidays.value,
          // Handles user interaction with the switch
          onChanged: (bool value) async {
            setState(() {
              SharedPreferencesUtils.globalHolidays.value = value;
            });
            await SharedPreferencesUtils.setGlobalHolidays(value);
          },
        ),
      ],
    );
  }
}
