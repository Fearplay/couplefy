import 'package:flutter/material.dart';
import 'package:couplefy/data/name_day.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/utils/tab_name_utils.dart';
import 'package:couplefy/widgets/namedayscreen/name_day_row.dart';

class NameDayScreen extends StatefulWidget {
  const NameDayScreen({super.key});

  @override
  State<NameDayScreen> createState() => _NameDayScreenState();
}

class _NameDayScreenState extends State<NameDayScreen> {
  String? savedLanguage;

  @override
  void initState() {
    super.initState();

    savedLanguage = SharedPreferencesUtils.selectedValue ?? "en";
  }

  @override
  Widget build(BuildContext context) {
    print(savedLanguage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TabNameUtils(AppLocalizations.of(context)!.nameDayTabName),
        Expanded(
                    child: ListView.builder(
            itemCount:
                nameDays.where((n) => n.languageCode == "cs").length,
            itemBuilder: (context, index) {
              final filteredNames = nameDays
                  .where((names) => names.languageCode == "cs")
                  .toList();
              return NameDayRow(filteredNames[index]);
            },
          ),
          // child: ListView.builder(
          //   itemCount:
          //       nameDays.where((n) => n.languageCode == savedLanguage).length,
          //   itemBuilder: (context, index) {
          //     final filteredNames = nameDays
          //         .where((names) => names.languageCode == savedLanguage)
          //         .toList();
          //     return NameDayRow(filteredNames[index]);
          //   },
          // ),
        ),
      ],
    );
  }
}
