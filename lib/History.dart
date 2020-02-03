import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;

class History extends StatefulWidget{

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DateTime _currentDate;

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {}
  );
  
  

  loadHabits() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habits = prefs.getStringList("habitList");
    print(habits);
  }

  @override
  Widget build(BuildContext context) {
    _markedDateMap.add(DateTime(2020,2,2), new Event(date: DateTime(2020, 2, 2)));

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel(
        showOnlyCurrentMonthDate: true,
        markedDatesMap: _markedDateMap,
//        current: DateTime.now(),
//        onDayPressed: (DateTime date) {
//          this.setState(() => _currentDate = date);
//        },
//        thisMonthDayBorderColor: Colors.grey,
//        height: 420.0,
//        selectedDateTime: _currentDate,
//        daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
//        markedDatesMap: _markedDateMap,
//          weekendStyle: TextStyle(
//            color: Colors.red,
//          ),
//          weekDays: null, /// for pass null when you do not want to render weekDays
//          headerText: Container( /// Example for rendering custom header
//            child: Text('Custom Header'),
//          ),
      ),
    );
  }
}


