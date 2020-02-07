import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';

class HabitView extends StatelessWidget {
  final Habit habit;
  const HabitView(
    this.habit,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(habit.icon != null ? habit.icon : Icons.access_alarm),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              habit.name,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
