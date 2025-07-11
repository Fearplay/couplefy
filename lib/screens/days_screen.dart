import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/data/entry_days_data.dart';
import 'package:couplefy/widgets/dayscreen/days_row.dart';

/// Name Day Screen (in app second position)
class DaysScreen extends StatefulWidget {
  /// Creates an instance of [DaysScreen].
  const DaysScreen({super.key});

  @override
  State<DaysScreen> createState() => _DaysScreenState();
}

class _DaysScreenState extends State<DaysScreen> {
  String? savedLanguage;

  @override
  void initState() {
    super.initState();
    savedLanguage = SharedPreferencesUtils.selectedValue ?? "en";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: dayEntries.where((n) => n.globalDay!.containsKey(savedLanguage)).length,
            itemBuilder: (context, index) {
              final filteredNames = dayEntries.where((names) => names.globalDay!.containsKey(savedLanguage)).toList();

              return DaysRow(filteredNames[index], savedLanguage);
            },
          ),
        ),
      ],
    );
  }
}
