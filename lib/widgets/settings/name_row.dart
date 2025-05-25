import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/love_counter_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Widget which displays name text and text fields.
class NameRow extends StatefulWidget {
  /// Creates an instance of [DateRow].
  const NameRow({super.key});

  @override
  State<NameRow> createState() => _NameRowState();
}

class _NameRowState extends State<NameRow> {
  final TextEditingController _firstPersonName = TextEditingController();
  final TextEditingController _secondPersonName = TextEditingController();

  /// Flag used to avoid showing the same error SnackBar multiple times.
  int countErrorMessage = 0;
  List<String> _savedNames = [];

  @override
  void initState() {
    super.initState();
    _firstPersonName.text = LoveCounterUtils.firstPersonName ?? '';
    _secondPersonName.text = LoveCounterUtils.secondPersonName ?? '';
  }

  /// Saves the couple's names if they are valid and have changed.
  ///
  /// This method checks if the names entered in the text fields are:
  /// - Different from the previously saved names
  /// - Both non-empty
  ///
  /// If the names are valid and different, it:
  /// - Updates the names in memory
  /// - Saves them to shared preferences
  /// - Shows a confirmation [SnackBar]
  ///
  /// If the names are unchanged, it does nothing.
  ///
  /// If either text field is empty, it shows an error [SnackBar] only twice.
  void savedNames() async {
    if (LoveCounterUtils.firstPersonName == _firstPersonName.text && LoveCounterUtils.secondPersonName == _secondPersonName.text) {
      // Do nothing if names are unchanged
    }
    // Save names if both fields are filled
    else if (_firstPersonName.text.isNotEmpty && _secondPersonName.text.isNotEmpty) {
      // Set count of error messages back to zero
      countErrorMessage = 0;
      LoveCounterUtils.firstPersonName = _firstPersonName.text;
      LoveCounterUtils.secondPersonName = _secondPersonName.text;
      _savedNames = [_firstPersonName.text, _secondPersonName.text];
      // Save names to SharedPreferences
      await SharedPreferencesUtils.setNames(_savedNames);
      if (!mounted) return;
      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.snackBarSaveNames,
            style: AppTextStyles.snackBarNames(context),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          padding: EdgeInsets.all(20),
          duration: Duration(seconds: 1),
        ),
      );
    }
    // If input is invalid (one or both fields empty), show error
    else {
      // Prevents error message to be spammed
      if (countErrorMessage <= 1) {
        // Add one more to countErrorMessage
        countErrorMessage++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.snackBarNames,
              style: AppTextStyles.snackBarNames(context),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            padding: EdgeInsets.all(20),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }
    // Close keyboard if open
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.settingsNameTitle,
          style: AppTextStyles.nameTextField(context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: _firstPersonName,
            maxLength: 11,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: LoveCounterUtils.firstPersonName ?? AppLocalizations.of(context)?.firstNameHint,
              hintStyle: AppTextStyles.hintText(context),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            controller: _secondPersonName,
            maxLength: 11,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: LoveCounterUtils.secondPersonName ?? AppLocalizations.of(context)?.secondNameHint,
              hintStyle: AppTextStyles.hintText(context),
            ),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 240,
            ), // ⟵ strop
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: savedNames,
                style: AppButtonStyles.allButtons(context),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    AppLocalizations.of(context)!.saveButtonNames,
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
