import 'package:flutter/material.dart';
import 'package:couplefy/theme/app_text_styles.dart';

class TabNameUtils extends StatelessWidget {
  const TabNameUtils(this.tabName, {super.key});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        tabName,
        style: AppTextStyles.tabName(context),
      ),
    );
  }
}
