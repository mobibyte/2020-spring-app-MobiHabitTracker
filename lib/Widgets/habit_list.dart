import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';
import 'package:mobi_habit_tracker/Widgets/habit_view.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  const HabitList(this.habits);

  @override
  Widget build(BuildContext context) {
    List<HabitView> habitViews =
        habits.map((habit) => HabitView(habit)).toList();
    return ListView(
      children: habitViews,
    );
  }
}
