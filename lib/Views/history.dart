import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DateTime _currentDate;

  EventList<Event> _markedDateMap = new EventList<Event>(events: {});

  loadHabits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habits = prefs.getStringList("habitList");
    print(habits);
  }

  @override
  Widget build(BuildContext context) {
//    _markedDateMap.add(
//        DateTime(2020, 2, 2), new Event(date: DateTime(2020, 2, 2))); // adding date marker example
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel(
          showOnlyCurrentMonthDate: true,
          markedDatesMap: _markedDateMap,
        ),
      );
  }
}
