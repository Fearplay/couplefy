import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/l10n/app_localizations.dart';

/// Widget which displays about app row.
class AboutAppRow extends StatelessWidget {
  /// Creates an instance of [AboutAppRow].
  const AboutAppRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            /// Create a new page where are located all licenses used in the project
            showAboutDialog(
              context: context,
              applicationName: 'Couplefy',
              applicationVersion: '1.6.8',
              applicationLegalese: '© 2025 FairplayX',
              // Logo of the app
              applicationIcon: Image.asset(
                'assets/images/app_icon.png',
                width: 48,
                height: 48,
              ),
            );
          },
          style: AppButtonStyles.textButton(context),
          child: Text(
            AppLocalizations.of(context)!.infoButton,
            style: AppTextStyles.optionsText(context),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
