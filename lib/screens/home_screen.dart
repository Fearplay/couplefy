import 'package:flutter/material.dart';
import 'package:couplefy/utils/tab_name_utils.dart';
import 'package:couplefy/widgets/homepage/homepage_cards.dart';
import 'package:couplefy/l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Tab name of the screen
        // TabNameUtils(AppLocalizations.of(context)!.homeTabName),
        Expanded(
          child: SingleChildScrollView(
            child: HomepageCard(),
          ),
        ),
      ],
    );
  }
}
