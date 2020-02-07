import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';
import 'package:mobi_habit_tracker/Widgets/habit_view.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final Function(int) onDismissed;
  const HabitList(this.habits, {this.onDismissed});

  @override
  Widget build(BuildContext context) {
    List<HabitView> habitViews = habits
        .map((habit) => HabitView(
              habit,
              habitIndex: habits.indexOf(habit),
              onDismissed: (index) {
                onDismissed(index);
              },
            ))
        .toList();
    return ListView(
      children: habitViews,
    );
  }
}
