
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> habits = ["Pushups", "Run 1 mile", "Read for 30 mins"];

  addHabit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("habitList", habits);
//    prefs.
  }

  printHabit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habits = prefs.getStringList("habitList");
    print(habits);
  }

  @override
  Widget build(BuildContext context) {
    addHabit();
    printHabit();

    return Text("Homepage");
  }
}