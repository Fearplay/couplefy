import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/widgets/settings/options/start_from_zero_switch.dart';
import 'package:couplefy/widgets/settings/options/support_me_row.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/widgets/settings/options/about_row.dart';
import 'package:couplefy/widgets/settings/options/dark_mode_switch.dart';
import 'package:couplefy/widgets/settings/options/days_only_switch.dart';
import 'package:couplefy/widgets/settings/options/language_menu.dart';

class OptionButtonsRow extends StatelessWidget {
  const OptionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                Text(
          AppLocalizations.of(context)!.settingsOptionsTitle,
          style: AppTextStyles.nameTextField(context),
        ),
        const SizedBox(
          height: 20,
        ),
        const DarkModeSwitch(),
        const SizedBox(
          height: 20,
        ),
        const DaysOnlySwitch(),
        const SizedBox(
          height: 20,
        ),
        const StartFromZeroSwitch(),
        const SizedBox(
          height: 20,
        ),
        const LanguageMenu(),
        const SizedBox(
          height: 20,
        ),
        const SupportMeRow(),
        const SizedBox(
          height: 20,
        ),
        const AboutRow(),
      ],
    );
  }
}
