import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';
import 'package:couplefy/utils/love_counter_utils.dart';
import 'package:couplefy/utils/tab_name_utils.dart';
import 'package:couplefy/widgets/lovescreen/love_counter_image_pick.dart';
import 'package:couplefy/widgets/lovescreen/love_duration.dart';
import 'package:couplefy/widgets/lovescreen/names_together.dart';
import 'package:couplefy/l10n/app_localizations.dart';


class LoveScreen extends StatelessWidget {
  const LoveScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TabNameUtils(AppLocalizations.of(context)!.loveTabName),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    NamesTogether(AppTextStyles.loveScreenTitleText(context)),
                    SizedBox(height: 10,),
                    LoveCounterImagePick(),
                    SizedBox(height: 10,),
                    // SizedBox(height: 20,),
// NamesTogether(),
          LoveDuration(),
          //           ValueListenableBuilder<bool>(
          //   valueListenable: DatePickerUtils.showOnlyDays,
          //   builder: (context, showOnlyDays, _) {
          //     final text = showOnlyDays
          //         ? "${DatePickerUtils.daysTogether()} days Together"
          //         : "${DatePickerUtils.yearsTogether()} days Together";
          //
          //     return Text(
          //       text,
          //       style: const TextStyle(fontSize: 28),
          //     );
          //   },
          // ),
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
