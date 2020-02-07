import 'package:flutter/material.dart';
import 'package:mobi_habit_tracker/Models/index.dart';

class HabitCreator extends StatefulWidget {
  final void Function(Habit) onAddHabit;
  HabitCreator({this.onAddHabit});

  @override
  _HabitCreatorState createState() => _HabitCreatorState();
}

class _HabitCreatorState extends State<HabitCreator> {
  Habit _habit;

  @override
  void initState() {
    _habit = Habit(
      '',
      icon: Icon(
        Icons.star,
        color: Colors.orange,
      ),
      completed: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habit Creator"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.blue,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.transparent,
              ),
            ),
            child: Text(
              "Done",
              style: TextStyle(
                fontSize: 18,
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text("Choose an Icon"),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 48,
                    ),
                    Radio(
                      groupValue: _habit.icon.icon.codePoint,
                      value: Icons.star.codePoint,
                      onChanged: (value) {
                        setState(() {
                          _habit.icon = Icon(
                            IconData(value),
                            color: Colors.orange,
                          );
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                      size: 48,
                    ),
                    Radio(
                      groupValue: _habit.icon.icon.codePoint,
                      value: Icons.access_time.codePoint,
                      onChanged: (value) {
                        setState(() {
                          _habit.icon = Icon(
                            IconData(value),
                            color: Colors.grey,
                          );
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.whatshot,
                      color: Colors.red,
                      size: 48,
                    ),
                    Radio(
                      groupValue: _habit.icon.icon.codePoint,
                      value: Icons.whatshot.codePoint,
                      onChanged: (value) {
                        setState(() {
                          _habit.icon = Icon(
                            IconData(value),
                            color: Colors.red,
                          );
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Colors.green,
                      size: 48,
                    ),
                    Radio(
                      groupValue: _habit.icon.icon.codePoint,
                      value: Icons.attach_money.codePoint,
                      onChanged: (value) {
                        setState(() {
                          _habit.icon = Icon(
                            IconData(value),
                            color: Colors.green,
                          );
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
