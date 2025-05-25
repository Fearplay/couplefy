import 'package:couplefy/theme/app_button_styles.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Widget which displays date text and text field.
class DateRow extends StatefulWidget {
  /// Creates an instance of [DateRow].
  const DateRow({super.key});

  @override
  State<DateRow> createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    final savedDate = DatePickerUtils.loveDate;
    if (savedDate != null) {
      _dateController.text = DatePickerUtils.makeEuropeDate(DateTime.parse(savedDate)) ?? '';
    }
  }

  /// Opens a date picker and updates the selected date and text field if a date is picked.
  ///
  /// Uses [DatePickerUtils.selectDate] to let the user choose a date.
  /// If a date is selected, it:
  /// - Updates the [_selectedDate] state
  /// - Formats the date using European format and sets it in [_dateController]
  Future<void> _selectDate() async {
    DateTime? picked = await DatePickerUtils.selectDate(context: context);
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DatePickerUtils.makeEuropeDate(picked)!;
      });
    }
  }

  /// Saves the selected date to shared preferences and shows a confirmation SnackBar.
  ///
  /// Only proceeds if:
  /// - A date is selected
  /// - The selected date is different from the already saved love date
  ///
  /// Performs the following:
  /// - Converts the selected date to a formatted string
  /// - Saves it to [SharedPreferences] using [SharedPreferencesUtils.setLoveDate]
  /// - Shows a localized SnackBar message as confirmation
  Future<void> _saveDate() async {
    if (_selectedDate != null) {
      String selectedDateString = _selectedDate!.toString().split(" ")[0];
      if (!mounted) return;
      // Close keyboard if open
      FocusScope.of(context).unfocus();
      // Avoid re-saving the same date
      if (DatePickerUtils.loveDate == selectedDateString) {
        return;
      }
      // Save new date to memory and shared preferences
      DatePickerUtils.loveDate = selectedDateString;
      await SharedPreferencesUtils.setLoveDate(_selectedDate!);
      if (!mounted) return;
      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.snackBarSaveDate,
            style: AppTextStyles.snackBarNames(context),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          padding: EdgeInsets.all(20),
          duration: Duration(seconds: 1),
        ),
      );
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
            onTap: _selectDate,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 240), // ⟵ strop
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: _saveDate,
                style: AppButtonStyles.allButtons(context),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    AppLocalizations.of(context)!.saveButtonDate,
                    style: AppTextStyles.buttonText(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
