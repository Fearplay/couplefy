import 'package:flutter/material.dart';
import 'package:couplefy/models/name_day_model.dart';
import 'package:couplefy/theme/app_colors.dart';
import 'package:couplefy/theme/app_text_styles.dart';
import 'package:couplefy/utils/date_picker_utils.dart';

class NameDayRow extends StatefulWidget {
  const NameDayRow(this.nameDayModel, {super.key});

  final NameDayModel nameDayModel;

  @override
  State<NameDayRow> createState() => _NameDayRowState();
}

class _NameDayRowState extends State<NameDayRow> {
  @override
  Widget build(BuildContext context) {
    if (DatePickerUtils.todayDate.day == widget.nameDayModel.date.day && DatePickerUtils.todayDate.month == widget.nameDayModel.date.month){
      return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.firstTodayMarkColor, AppColors.secondTodayMarkColor]),
        // gradient: LinearGradient(colors: [Color(0xFF64B5F6), Color(0xFFBBDEFB)]),

        border: Border.all(),
        // color: Theme.of(context).colorScheme.primaryContainer,
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
          ),],),);
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Theme.of(context).colorScheme.primaryFixed, Theme.of(context).colorScheme.secondaryFixed], begin: Alignment.bottomRight, end: Alignment.topLeft),

        border: Border.all(),
        // color: Theme.of(context).colorScheme.primaryContainer,
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
          // Text(
          //     "${widget.nameDayModel.name} / ${widget.nameDayModel.date.day.toString().padLeft(2, '0')}.${widget.nameDayModel.date.month.toString().padLeft(2, '0')} / ${widget.nameDayModel.languageCode}"),
          // // "${name.name} / ${name.date.day.toString().padLeft(2, '0')}.${name.date.month.toString().padLeft(2, '0')} / ${name.languageCode}"),

          // Text("${name.name} / ${name.date.day.toString().padLeft(2, '0')}.${name.date.month.toString().padLeft(2, '0')} / ${name.languageCode}"),
          // Text()
        ],
      ),
    );
  }
}
