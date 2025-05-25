import 'package:flutter/material.dart';
import 'package:couplefy/utils/love_counter_utils.dart';

/// A widget which will display names together.
class NamesTogether extends StatelessWidget {
  /// Creates an instance of [NamesTogether].
  const NamesTogether(this.nameStyle, {super.key});

  final TextStyle nameStyle;

  @override
  Widget build(BuildContext context) {
    // if the 'LoveCounterUtils.firstPersonName!.length' is lower than 9 and 'LoveCounterUtils.secondPersonName!.length' is lower than 9. Then this happen:
    if (LoveCounterUtils.firstPersonName == null && LoveCounterUtils.secondPersonName == null || (LoveCounterUtils.firstPersonName!.length <= 8 && LoveCounterUtils.secondPersonName!.length <= 8)) {
      // Text for 'first name + second name'
      return Text(
        LoveCounterUtils.namesTogether(context),
        style: nameStyle,
        textAlign: TextAlign.center,
      );
    }
    // if the 'LoveCounterUtils.firstPersonName!.length' is greater than 8 and 'LoveCounterUtils.secondPersonName!.length' is greater than 8. Then this happen:
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          // Text for first name.
          Text(
            LoveCounterUtils.namesListTogether()[0],
            style: nameStyle,
            textAlign: TextAlign.center,
          ),
          // Text for '+'.
          Text(
            LoveCounterUtils.namesListTogether()[1],
            style: nameStyle,
            textAlign: TextAlign.center,
          ),
          // Text for second name.
          Text(
            LoveCounterUtils.namesListTogether()[2],
            style: nameStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
