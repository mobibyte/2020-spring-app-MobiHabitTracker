import 'package:flutter/material.dart';

class Habit {
  String name;
  bool completed;
  Icon icon;

  Habit(this.name, {this.icon, this.completed});

  Habit.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    completed = json['completed'] ?? false;
    icon = iconFromString(json['icon']) ?? null;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'completed': completed,
        'icon': iconToString(icon),
      };

  Icon iconFromString(String string) {
    switch (string) {
      case "star":
        {
          return Icon(Icons.star, color: Colors.orange, size: 36);
        }
      case "clock":
        {
          return Icon(Icons.access_time, color: Colors.grey, size: 36);
        }
      case "fire":
        {
          return Icon(Icons.whatshot, color: Colors.red, size: 36);
        }
      case "money":
        {
          return Icon(Icons.attach_money, color: Colors.green, size: 36);
        }
      default:
        {
          return Icon(Icons.star, color: Colors.orange, size: 36);
        }
    }
  }

  String iconToString(Icon icon) {
    int codePoint = icon.icon.codePoint;
    if (codePoint == Icons.star.codePoint) {
      return "star";
    } else if (codePoint == Icons.access_time.codePoint) {
      return "clock";
    } else if (codePoint == Icons.whatshot.codePoint) {
      return "fire";
    } else if (codePoint == Icons.attach_money.codePoint) {
      return "money";
    } else {
      return "star";
    }
  }
}
