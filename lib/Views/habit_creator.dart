import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';

class HabitCreator extends StatefulWidget {
  final void Function(Habit) onAddHabit;
  HabitCreator({this.onAddHabit});

  @override
  _HabitCreatorState createState() => _HabitCreatorState();
}

class _HabitCreatorState extends State<HabitCreator> {
  Habit _habit = Habit('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habit Creator"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
            child: Text(
              "Done",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onPressed: () {
              if (_habit.name != '') {
                widget.onAddHabit(_habit);
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              onChanged: (value) => setState(
                () => _habit.name = value,
              ),
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Name of habit",
              ),
            ),
          )
        ],
      ),
    );
  }
}
