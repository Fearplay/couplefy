import 'package:flutter/material.dart';
import 'package:couplefy/widgets/homepage/homepage_cards.dart';

/// Home Screen (in app third position)
class HomeScreen extends StatelessWidget {
  /// Creates an instance of [HomeScreen].
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            // Widget with all home page cards
            child: HomepageCard(),
          ),
        ),
      ],
    );
  }
}
