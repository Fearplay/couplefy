import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Widget which displays starts from zero row.
class StartFromZeroSwitch extends StatefulWidget {
  /// Creates an instance of [StartFromZeroSwitch].
  const StartFromZeroSwitch({super.key});

  @override
  State<StartFromZeroSwitch> createState() => _StartFromZeroSwitchState();
}

class _StartFromZeroSwitchState extends State<StartFromZeroSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.startFromZeroText,
          style: AppTextStyles.optionsText(context),
        ),
        Switch(
          activeColor: AppColors.switchActiveColor,
          inactiveThumbColor: AppColors.switchInactiveThumbColor,
          activeTrackColor: AppColors.switchActiveTrackColor,
          inactiveTrackColor: AppColors.switchInactiveTrackColor,
          value: SharedPreferencesUtils.startFromZero.value,
          // Handles user interaction with the switch
          onChanged: (bool value) async {
            setState(() {
              SharedPreferencesUtils.startFromZero.value = value;
            });
            await SharedPreferencesUtils.setStartFromZero(value);
          },
        ),
      ],
    );
  }
}
