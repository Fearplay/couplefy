import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/widgets/settings/options/global_holidays_switch.dart';
import 'package:couplefy/widgets/settings/options/start_from_zero_switch.dart';
import 'package:couplefy/widgets/settings/options/support_me_row.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/widgets/settings/options/about_app_row.dart';
import 'package:couplefy/widgets/settings/options/dark_mode_switch.dart';
import 'package:couplefy/widgets/settings/options/days_only_switch.dart';
import 'package:couplefy/widgets/settings/options/language_menu.dart';

/// A widget that displays options in a vertical layout.
///
/// Includes:
/// - Dark mode
/// - Days only
/// - Start from zero
/// - Language menu
/// - Support me
/// - About app
class OptionButtonsRow extends StatelessWidget {
  /// Creates an instance of [OptionButtonsRow].
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
        // Dark Mode widget
        const DarkModeSwitch(),
        const SizedBox(
          height: 20,
        ),
        // International Holidays widget
        const GlobalHolidaysSwitch(),
        const SizedBox(
          height: 20,
        ),
        // Days only widget
        const DaysOnlySwitch(),
        const SizedBox(
          height: 20,
        ),
        // Start from zero widget
        const StartFromZeroSwitch(),
        const SizedBox(
          height: 20,
        ),
        // Language menu widget
        const LanguageMenu(),
        const SizedBox(
          height: 20,
        ),
        // Support me widget
        const SupportMeRow(),
        const SizedBox(
          height: 20,
        ),
        // About App widget
        const AboutAppRow(),
      ],
    );
  }
}
