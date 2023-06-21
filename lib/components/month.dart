import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/lunar_canlendar.dart';

class MonthComponent {
  static Widget calendarItem(
      {required bool isLunar,
      required DateTime day,
      required Color textColor,
      FontWeight fontWeight = FontWeight.normal}) {
    if (isLunar) {
      final lunarDay = CalendarConverter.solarToLunar(
          day.year, day.month, day.day, Timezone.Vietnamese);
      return Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${lunarDay[0]}',
            style: TextStyle(color: textColor, fontWeight: fontWeight),
          ),
          Text(
            '/${lunarDay[1]}${lunarDay[3] == 1 ? '*' : ''}',
            style: TextStyle(
                color: textColor, fontWeight: fontWeight, fontSize: 11),
          ),
        ],
      ));
    } else {
      final text = DateFormat.d().format(day);
      return Center(
          child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: fontWeight),
      ));
    }
  }
}
