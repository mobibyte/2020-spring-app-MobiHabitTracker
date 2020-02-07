import 'dart:convert';

import 'package:flutter/material.dart';

class Habit {
  String name;
  IconData icon;

  Habit(this.name, {this.icon});

  Habit.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        icon = json['icon'];

  Map<String, dynamic> toJson() => {'name': name, 'icon': icon};
}
