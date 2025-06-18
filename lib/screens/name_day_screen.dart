import 'package:flutter/material.dart';
import 'package:couplefy/data/name_day.dart';
import 'package:couplefy/widgets/namedayscreen/name_day_row.dart';
// import 'package:couplefy/l10n/app_localizations.dart';
// import 'package:couplefy/utils/shared_preferences_utils.dart';

/// Name Day Screen (in app second position)
class NameDayScreen extends StatefulWidget {
  /// Creates an instance of [NameDayScreen].
  const NameDayScreen({super.key});

  @override
  State<NameDayScreen> createState() => _NameDayScreenState();
}

class _NameDayScreenState extends State<NameDayScreen> {
  //   String? savedLanguage;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   savedLanguage = SharedPreferencesUtils.selectedValue ?? "en";
  // }


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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            // Count all items where languageCode equals to cs
            itemCount: nameDays.where((n) => n.languageCode == "cs").length,
            itemBuilder: (context, index) {
              // Convert all names with cs languageCode to list
              final filteredNames = nameDays.where((names) => names.languageCode == "cs").toList();
              // Return Widget with all these filtered names
              return NameDayRow(filteredNames[index]);
            },
          ),
        ),
      ],
    );
  }
}
