import 'package:flutter/material.dart';
import 'package:lich_viet_nam/components/month.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthScreen extends StatefulWidget {
  const MonthScreen({super.key, required this.title});
  final String title;

  @override
  State<MonthScreen> createState() => _MonthScreenState();
}

class _MonthScreenState extends State<MonthScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              locale: Localizations.localeOf(context).languageCode,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              calendarBuilders:
                  CalendarBuilders(defaultBuilder: (context, day, focusDate) {
                return MonthComponent.calendarItem(
                    isLunar: false, day: day, textColor: Colors.black);
              }, selectedBuilder: (context, day, focusDate) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.5),
                      shape: BoxShape.rectangle,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: MonthComponent.calendarItem(
                        isLunar: false,
                        day: day,
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold));
              }, todayBuilder: (context, day, focusDate) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: MonthComponent.calendarItem(
                        isLunar: false,
                        day: day,
                        textColor: Colors.black,
                        fontWeight: FontWeight.w500));
              }, outsideBuilder: (context, day, focusDate) {
                return MonthComponent.calendarItem(
                    isLunar: false,
                    day: day,
                    textColor: Colors.black.withOpacity(0.5));
              }),
            )
          ],
        ),
      ),
    );
  }
}
