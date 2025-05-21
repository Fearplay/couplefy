import 'dart:math';

import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class DateRow extends StatefulWidget {
  const DateRow({super.key});

  @override
  State<DateRow> createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  final TextEditingController _dateController = TextEditingController();
  static const _prefsKey = 'loveDateMs';

  @override
  void initState() {
    super.initState();
    final savedDate = DatePickerUtils.loveDate;
    if (savedDate != null) {
      _dateController.text =
          DatePickerUtils.makeEuropeDate(DateTime.parse(savedDate)) ?? '';
    }
  }

  Future<void> _selectDate() async {
    DateTime? picked = await DatePickerUtils.selectDate(context: context);
    if (picked != null) {
      DatePickerUtils.loveDate = picked.toString().split(" ")[0];
      await SharedPreferencesUtils.setLoveDate(picked);
      setState(() {
        // _dateController.text = picked.toString().split(" ")[0];
        _dateController.text = DatePickerUtils.makeEuropeDate(picked)!;

        // int timestamp = DatePickerUtils.loveDate as int;
        // DatePickerUtils.loveDate = _dateController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Text(
            AppLocalizations.of(context)!.settingsDateTitle,
            style: AppTextStyles.nameTextField(context),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.dateLabel,
              hintText: AppLocalizations.of(context)!.datePickerHintText,
              labelStyle: AppTextStyles.hintText(context),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              prefixIcon: const Icon(Icons.calendar_today),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            readOnly: true,
            onTap: () {
              _selectDate();
            },
          ),
        ),
      ],
    );
  }
}
