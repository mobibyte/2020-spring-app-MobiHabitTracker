import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class History extends StatefulWidget {
  const History({Key key, this.habitName}) : super(key: key);
  final String habitName;

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  static Widget _eventIcon(String day) => Container(
    decoration: new BoxDecoration(
        color: Colors.teal[300],
    ),
    child: Center(
      child: Text(
        day, 
        style: TextStyle(color: Colors.black),
      ),
    )
  );

  EventList<Event> _markedDateMap = new EventList<Event>(events: {});

  loadHabit() async {
    EventList<Event> newMarkedDateMap = new EventList<Event>(events: {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habits = prefs.getStringList(widget.habitName);

    for(String dateString in habits){
      var date = dateString.split(",");
      int year = int.parse(date[0]);
      int month = int.parse(date[1]);
      int day = int.parse(date[2]);

      newMarkedDateMap.add(new DateTime(year, month, day), new Event(
        date: new DateTime(year,month,day),
        title: 'Completed',
        icon: _eventIcon(day.toString())
      ));
    }
    setState(() {
      _markedDateMap = newMarkedDateMap;
    });
  }

  // For testing! 
  // addDummyDate() async{
  //   List<String> dates = ["2020,2,1", "2020,2,2", "2020,2,3"];
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList(widget.habitName, dates);
  // }

  @override
  void initState(){
      super.initState();
      loadHabit();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Habit ${widget.habitName}"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel(
          showOnlyCurrentMonthDate: true,
          markedDatesMap: _markedDateMap,
          todayButtonColor: Colors.transparent,
          todayTextStyle: TextStyle(color: Colors.black),
          markedDateShowIcon: true,
          markedDateIconMaxShown: 1,
          markedDateMoreShowTotal: null,
          markedDateIconBuilder: (event){
            return event.icon;
          },
        ),
      ),
    );
  }
}
