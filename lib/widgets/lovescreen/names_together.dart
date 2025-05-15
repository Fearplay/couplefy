import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/love_counter_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamesTogether extends StatefulWidget {
  const NamesTogether(this.nameStyle,{super.key});

  final TextStyle nameStyle;

  @override
  State<NamesTogether> createState() => _NamesTogetherState();
}

class _NamesTogetherState extends State<NamesTogether> {
  @override
  Widget build(BuildContext context) {
    if (LoveCounterUtils.firstPersonName == null &&
        LoveCounterUtils.secondPersonName == null || (LoveCounterUtils.firstPersonName!.length <= 8 && LoveCounterUtils.secondPersonName!.length <= 8)) {
      return Text(
        LoveCounterUtils.namesTogether(context),
        style: widget.nameStyle,
        textAlign: TextAlign.center,
      );
    }
    // else if(LoveCounterUtils.firstPersonName!.length <= 8 && LoveCounterUtils.secondPersonName!.length <= 8){
    //        return Text(
    //     LoveCounterUtils.namesTogether(context),
    //     style: AppTextStyles.middleHomePageText(context),
    //     textAlign: TextAlign.center,
    //   );
    // }
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
           // SizedBox(height: 4),
          Text(

            LoveCounterUtils.namesListTogether(context)[0],
            style: widget.nameStyle,
            textAlign: TextAlign.center,
          ),

          Text(
            LoveCounterUtils.namesListTogether(context)[1],
            style: widget.nameStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            LoveCounterUtils.namesListTogether(context)[2],
            style: widget.nameStyle,
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: 4),
          // Text(
          //   LoveCounterUtils.namesTogether(context),
          //   style: AppTextStyles.middleHomePageText(context),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
