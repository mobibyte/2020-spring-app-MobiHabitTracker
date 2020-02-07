import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';
import 'package:mobi_habit_tracker/Widgets/habit_view.dart';
import 'package:mobi_habit_tracker/Views/history.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final Function(int) onDeleted;
  final Function(int) onCompleted;
  const HabitList(this.habits, {this.onDeleted, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    List<HabitView> habitViews = habits
        .map((habit) => HabitView(
              habit,
              habitIndex: habits.indexOf(habit),
              onDeleted: (index) {
                onDeleted(index);
              },
              onCompleted: (index) {
                onCompleted(index);
              },
            ))
        .toList();
    return ListView(
      children: habitViews,
    );
  }
}
