import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';

class HabitView extends StatelessWidget {
  final Habit habit;
  final int habitIndex;
  final Function(int) onDeleted;
  final Function(int) onCompleted;
  const HabitView(
    this.habit, {
    this.habitIndex,
    this.onDeleted,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: stackBehindDismiss(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDeleted(habitIndex);
      },
      child: GestureDetector(
        onLongPress: () {
          if (!habit.completed) {
            onCompleted(habitIndex);
          }
        },
        child: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              habit.icon,
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  habit.name,
                  style: TextStyle(
                    fontSize: 24,
                    decoration:
                        habit.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Spacer(),
              if (habit.completed) Icon(Icons.check, color: Colors.green),
            ],
          ),
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
