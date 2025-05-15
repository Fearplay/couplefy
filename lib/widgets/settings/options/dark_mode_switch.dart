import 'package:flutter/material.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.darkModeText,
          style: AppTextStyles.optionsText(context),
        ),
        Switch(
          activeColor: AppColors.switchActiveColor,
          inactiveThumbColor: AppColors.switchInactiveThumbColor,

          activeTrackColor: AppColors.switchActiveTrackColor,
          inactiveTrackColor: AppColors.switchInactiveTrackColor,
          // thumbIcon: thumbIcon(Icons.safety_check),
          value: SharedPreferencesUtils.darkMode.value,
          onChanged: (bool value) async {
            setState(() {
              SharedPreferencesUtils.darkMode.value = value;
            });
            await SharedPreferencesUtils.setDarkMode(value);
          },
        ),
      ],
    );
  }
}
