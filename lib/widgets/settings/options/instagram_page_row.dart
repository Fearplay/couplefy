import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Widget which displays support me row.
class InstagramPageRow extends StatefulWidget {
  /// Creates an instance of [InstagramPageRow].
  const InstagramPageRow({super.key});

  @override
  State<InstagramPageRow> createState() => _InstagramPageRowState();
}

class _InstagramPageRowState extends State<InstagramPageRow> {
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
        Icon(FontAwesomeIcons.instagram),
        SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () => setState(() {
            _launchInBrowser(
              // My URL on instagram.com
              Uri.parse('https://www.instagram.com/indietapstudio/'),
            );
          }),
          style: AppButtonStyles.textButton(context),
          child: Text(
            AppLocalizations.of(context)!.instagramButton,
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
