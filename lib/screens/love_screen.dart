import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/widgets/lovescreen/love_counter_image_pick.dart';
import 'package:couplefy/widgets/lovescreen/love_duration.dart';
import 'package:couplefy/widgets/lovescreen/names_together.dart';

/// Love Screen (in app first position)
class LoveScreen extends StatelessWidget {
  /// Creates an instance of [LoveScreen].
  const LoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    NamesTogether(
                      AppTextStyles.loveScreenTitleText(
                        context,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Widget allowing the user to pick an image from gallery or camera
                    LoveCounterImagePick(),
                    SizedBox(
                      height: 10,
                    ),
                    // Widget shows how long the couple has been together
                    LoveDuration(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
