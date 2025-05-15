import 'package:flutter/material.dart';
import 'package:couplefy/utils/tab_name_utils.dart';
import 'package:couplefy/widgets/settings/options/about_row.dart';
import 'package:couplefy/widgets/settings/date_row.dart';
import 'package:couplefy/widgets/settings/name_row.dart';
import 'package:couplefy/widgets/settings/option_buttons_row.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TabNameUtils(AppLocalizations.of(context)!.settingsTabName),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: const [
              NameRow(),
              DateRow(),
              OptionButtonsRow(),

            ],
          ),
        ),
      ],
    );
  }
}
