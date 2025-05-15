import 'package:flutter/material.dart';
import 'package:couplefy/widgets/settings/options/about_row.dart';
import 'package:couplefy/widgets/settings/options/dark_mode_switch.dart';
import 'package:couplefy/widgets/settings/options/days_only_switch.dart';
import 'package:couplefy/widgets/settings/options/language_menu.dart';

class OptionButtonsRow extends StatelessWidget {
  const OptionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
         SizedBox(height: 20,),
         DarkModeSwitch(),
         SizedBox(height: 20,),
         DaysOnlySwitch(),
         SizedBox(height: 20,),
         LanguageMenu(),
                 SizedBox(height: 20,),
AboutRow(),
          ],
        );


  }
}
