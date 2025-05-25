import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget which displays support me row.
class SupportMeRow extends StatefulWidget {
  /// Creates an instance of [SupportMeRow].
  const SupportMeRow({super.key});

  @override
  State<SupportMeRow> createState() => _SupportMeRowState();
}

class _SupportMeRowState extends State<SupportMeRow> {
  /// Launches the given [url] in the default external browser.
  ///
  /// Uses [launchUrl] with [LaunchMode.externalApplication] to open the link
  /// outside of the app (e.g., in Chrome or Safari).
  ///
  /// Throws:
  /// - An [Exception] if the [url] cannot be launched.
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception(
        'Could not launch $url',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () => setState(() {
            _launchInBrowser(
              // My URL on buymeacoffee.com
              Uri.parse('https://buymeacoffee.com/saulfearplay'),
            );
          }),
          style: AppButtonStyles.textButton(context),
          child: Text(
            AppLocalizations.of(context)!.supportButton,
            style: AppTextStyles.optionsText(context),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.open_in_new,
        )
      ],
    );
  }
}
