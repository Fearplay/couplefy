import 'dart:io';

import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/theme/app_button_styles.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportMeRow extends StatefulWidget {
  const SupportMeRow({super.key});

  @override
  State<SupportMeRow> createState() => _SupportMeRowState();
}

class _SupportMeRowState extends State<SupportMeRow> {
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => setState(() {
            _launchInBrowser(
                Uri.parse('https://buymeacoffee.com/saulfearplay'));
          }),
          style: AppButtonStyles.aboutButton(context),
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
        // Text(AppLocalizations.of(context)!.infoButton,          style: AppTextStyles.optionsText(context),),
        // Icon(Icons.info),
      ],
    );
  }
}
