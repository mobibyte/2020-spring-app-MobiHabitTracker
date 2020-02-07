import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Views/habit_creator.dart';
import 'package:mobi_habit_tracker/Widgets/habit_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobi_habit_tracker/Models/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Habit> habits = [];

  @override
  void initState() {
    // This is the proper place to make the async calls
    // This way they only get called once

    // During development, if you change this code,
    // you will need to do a full restart instead of just a hot reload

    // You can't use async/await here,
    // We can't mark this method as async because of the @override
    retrieveHabits();
  }

  addHabit(Habit habit) async {
    habits.add(habit);
    setHabits(habits);
  }

  removeHabit(int index) async {
    habits.removeAt(index);
    setHabits(habits);
  }

  setHabits(List<Habit> habits) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> encodedHabits =
        habits.map((habit) => jsonEncode(habit)).toList();
    await prefs.setStringList('habits', encodedHabits);
    retrieveHabits();
  }

  retrieveHabits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> habitList = prefs.getStringList('habits');
    if (habitList != null) {
      setState(() {
        habits = habitList.map((habitString) {
          return Habit.fromJson(jsonDecode(habitString));
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobi Habit Tracker"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HabitCreator(
                onAddHabit: (habit) {
                  addHabit(habit);
                },
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: HabitList(
        habits,
        onDismissed: (index) {
          removeHabit(index);
        },
      ),
    );
  }
}
