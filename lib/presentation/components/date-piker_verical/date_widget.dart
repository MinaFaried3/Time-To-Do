import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

import 'tap.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: sizeConfig.isLandScape() ? 13 : 6,
            vertical: sizeConfig.isLandScape() ? 6 : 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                  color: selectionColor.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(4, 5)),
            ]),
        child: Container(
          width: width,
          margin: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            color: selectionColor,
            gradient: LinearGradient(
                colors: [selectionColor.withOpacity(0.6), selectionColor],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    DateFormat("MMM", locale)
                        .format(date)
                        .toUpperCase(), // Month
                    style: monthTextStyle),
                Text(date.day.toString(), // Date
                    style: dateTextStyle),
                Text(
                    DateFormat("E", locale)
                        .format(date)
                        .toUpperCase(), // WeekDay
                    style: dayTextStyle)
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
