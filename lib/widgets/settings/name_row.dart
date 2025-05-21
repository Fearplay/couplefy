import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/love_counter_utils.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class NameRow extends StatefulWidget {
  const NameRow({super.key});

  @override
  State<NameRow> createState() => _NameRowState();
}

class _NameRowState extends State<NameRow> {
  final TextEditingController _firstPersonName = TextEditingController();
  final TextEditingController _secondPersonName = TextEditingController();

  // final snackBar = SnackBar(content: Text(AppLocalizations.of(context)!.snackBarNames));

  SharedPreferences? _prefs;
  List<String> _savedNames = [];
  bool prefsReady = false;

  @override
  void initState() {
    super.initState();
    _firstPersonName.text = LoveCounterUtils.firstPersonName ?? '';
    _secondPersonName.text = LoveCounterUtils.secondPersonName ?? '';
  }

  // void _initPrefs() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   // _setPrefs();
  //   _getPrefs();
  // }

  void _setPrefs() {
    _prefs?.setStringList("loveNames", _savedNames);

  }

  // void _getPrefs() {
  //   final stored = _prefs?.getStringList("loveNames") ?? ["", ""];
  //
  //   setState(() {
  //     // if (stored != null && stored.length == 2) {
  //     //   _savedNames = stored;
  //     //   _firstPersonName.text = _savedNames[0];
  //     //   _secondPersonName.text = _savedNames[1];
  //     // } else {
  //     //   _savedNames = ["sdsdsdsd", "dddddddd"]; // fallback
  //     // }
  //        _savedNames = stored;
  //       _firstPersonName.text = _savedNames[0];
  //       _secondPersonName.text = _savedNames[1];

  //     // _firstPersonName.text = _savedNames[0];
  //     // _secondPersonName.text = _savedNames[1];
  //     prefsReady = true;
  //   });
  // }

  void savedNames() async {
    if (_firstPersonName.text.isNotEmpty && _secondPersonName.text.isNotEmpty) {
      LoveCounterUtils.firstPersonName = _firstPersonName.text;
      LoveCounterUtils.secondPersonName = _secondPersonName.text;
      _savedNames = [_firstPersonName.text, _secondPersonName.text];
      await SharedPreferencesUtils.setNames(_savedNames);
      if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.snackBarSave,
            style: AppTextStyles.snackBarNames(context),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          padding: EdgeInsets.all(20),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
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
              hintText: LoveCounterUtils.firstPersonName ??
                  AppLocalizations.of(context)?.firstNameHint,
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
              hintText: LoveCounterUtils.secondPersonName ??
                  AppLocalizations.of(context)?.secondNameHint,
              hintStyle: AppTextStyles.hintText(context),
            ),
          ),
        ),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 240), // ⟵ strop
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: savedNames,
                style: AppButtonStyles.allButtons(context),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    AppLocalizations.of(context)!.saveButton,
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
