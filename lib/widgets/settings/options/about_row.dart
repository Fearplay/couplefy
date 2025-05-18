import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/l10n/app_localizations.dart';

class AboutRow extends StatelessWidget {
  const AboutRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: 'Couplefy',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2025 FairplayX',
              applicationIcon: Image.asset('assets/images/app_icon.png',
                  width: 48, height: 48),
            );
          },
          style: AppButtonStyles.aboutButton(context),
          child: Text(
            AppLocalizations.of(context)!.infoButton,
            style: AppTextStyles.optionsText(context),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        // Text(AppLocalizations.of(context)!.infoButton,          style: AppTextStyles.optionsText(context),),
        // Icon(Icons.info),
      ],
    );
  }
}
