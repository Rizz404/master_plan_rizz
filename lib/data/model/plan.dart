import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:master_plan/data/model/task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  Plan({this.name = 'Default name', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';

  Plan copyWith({String? name, List<Task>? tasks}) {
    return Plan(name: name ?? this.name, tasks: tasks ?? this.tasks);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      name: map['name'] as String,
      tasks: List<Task>.from(
        (map['tasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Plan(name: $name, tasks: $tasks)';

  @override
  bool operator ==(covariant Plan other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => name.hashCode ^ tasks.hashCode;
}
