import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class StartFromZeroSwitch extends StatefulWidget {
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

          // thumbIcon: thumbIcon(Icons.safety_check),
          value: SharedPreferencesUtils.startFromZero.value,

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
