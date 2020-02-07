import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';

class HabitView extends StatelessWidget {
  final Habit habit;
  final int habitIndex;
  final Function(int) onDismissed;
  const HabitView(this.habit, {this.habitIndex, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(habitIndex.toString()),
      background: stackBehindDismiss(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDismissed(habitIndex);
      },
      child: Padding(
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
      ),
    );
  }
}

Widget stackBehindDismiss() {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20.0),
    color: Colors.red,
    child: Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );
}
