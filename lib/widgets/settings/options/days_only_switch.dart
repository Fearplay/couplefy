import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Widget which displays days only row.
class DaysOnlySwitch extends StatefulWidget {
  /// Creates an instance of [DaysOnlySwitch].
  const DaysOnlySwitch({super.key});

  @override
  State<DaysOnlySwitch> createState() => _DaysOnlySwitchState();
}

class _DaysOnlySwitchState extends State<DaysOnlySwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.showOnlyDaysText,
          style: AppTextStyles.optionsText(context),
        ),
        Switch(
          activeColor: AppColors.switchActiveColor,
          inactiveThumbColor: AppColors.switchInactiveThumbColor,
          activeTrackColor: AppColors.switchActiveTrackColor,
          inactiveTrackColor: AppColors.switchInactiveTrackColor,
          value: DatePickerUtils.showOnlyDays.value,
          // Handles user interaction with the switch
          onChanged: (bool value) async {
            setState(() {
              DatePickerUtils.showOnlyDays.value = value;
            });
            await SharedPreferencesUtils.setShowOnlyDays(value);
          },
        ),
      ],
    );
  }
}
