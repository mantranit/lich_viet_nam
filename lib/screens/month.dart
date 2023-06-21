import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lich_viet_nam/utils/lunar_canlendar.dart';

class MonthScreen extends StatefulWidget {
  const MonthScreen({super.key, required this.title});
  final String title;

  @override
  State<MonthScreen> createState() => _MonthScreenState();
}

class _MonthScreenState extends State<MonthScreen> {
  final DateTime _selectedDate = DateTime.utc(2023, 6);
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
            ConstrainedBox(
                constraints: BoxConstraints.loose(
                    Size(MediaQuery.of(context).size.width, 400.0)),
                child: Swiper(
                  outer: false,
                  itemBuilder: (c, i) {
                    List<Widget> days = [];
                    var firstMonth = _selectedDate.weekday;
                    for (var i = 0; i < firstMonth; i++) {
                      var monthLeap = CalendarConverter.getLeapMonthOffset(
                          2, Timezone.Vietnamese);
                      if (monthLeap > 12) {
                        monthLeap = monthLeap - 11;
                      }
                      days.add(SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.width / 7,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${CalendarConverter.lunarToSolar(2023, 2, 4, monthLeap == 2 ? 1 : 0, Timezone.Vietnamese)}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            )),
                      ));
                    }
                    for (var i = firstMonth; i < 30 + firstMonth; i++) {
                      days.add(SizedBox(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.width / 7,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${i - firstMonth + 1}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  DateFormat.E().format(_selectedDate),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                )
                              ],
                            )),
                      ));
                    }
                    return Wrap(
                      children: days,
                    );
                  },
                  pagination:
                      const SwiperPagination(margin: EdgeInsets.all(5.0)),
                  itemCount: 10,
                )),
          ],
        ),
      ),
    );
  }
}
