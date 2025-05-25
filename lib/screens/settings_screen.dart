import 'package:flutter/material.dart';
import 'package:couplefy/widgets/settings/date_row.dart';
import 'package:couplefy/widgets/settings/name_row.dart';
import 'package:couplefy/widgets/settings/option_buttons_row.dart';

/// Settings Screen (in app fifth position)
class SettingsScreen extends StatelessWidget {
  /// Creates an instance of [SettingsScreen].
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: const [
              // Widget for choosing names
              NameRow(),
              SizedBox(
                height: 10,
              ),
              // Widget for choosing date
              DateRow(),
              SizedBox(
                height: 35,
              ),
              // Widget for choosing options
              OptionButtonsRow(),
            ],
          ),
        ),
      ],
    );
  }
}
