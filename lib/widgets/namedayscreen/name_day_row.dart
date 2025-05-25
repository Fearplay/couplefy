import 'package:couplefy/screens/name_day_screen.dart';
import 'package:flutter/material.dart';
import 'package:couplefy/models/name_day_model.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';

/// A widget that displays the container with name and date in the [NameDayScreen].
class NameDayRow extends StatefulWidget {
  /// Creates an instance of [NameDayRow].
  ///
  ///   Parameters:
  /// - [nameDayModel]: The name day model as [List].
  const NameDayRow(this.nameDayModel, {super.key});

  final NameDayModel nameDayModel;

  @override
  State<NameDayRow> createState() => _NameDayRowState();
}

class _NameDayRowState extends State<NameDayRow> {
  @override
  Widget build(BuildContext context) {
    // If the day is current day. Then this happen:
    if (DatePickerUtils.todayDate.day == widget.nameDayModel.date.day && DatePickerUtils.todayDate.month == widget.nameDayModel.date.month) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Only different colors.
            colors: [
              AppColors.firstTodayMarkColor,
              AppColors.secondTodayMarkColor,
            ],
          ),
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.nameDayModel.name,
                  style: AppTextStyles.todayNameDayRow(context),
                ),
                Text(
                  "${widget.nameDayModel.date.day.toString().padLeft(2, '0')}.${widget.nameDayModel.date.month.toString().padLeft(2, '0')}",
                  style: AppTextStyles.todayNameDayRow(context),
                ),
              ],
            ),
          ],
        ),
      );
    }
    // If the day is not current day. Then this happen:
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Only different colors
          colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.nameDayModel.name,
                style: AppTextStyles.nameDayRow(context),
              ),
              Text(
                "${widget.nameDayModel.date.day.toString().padLeft(2, '0')}.${widget.nameDayModel.date.month.toString().padLeft(2, '0')}",
                style: AppTextStyles.nameDayRow(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
