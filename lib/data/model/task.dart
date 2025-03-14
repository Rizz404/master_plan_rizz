import 'dart:convert';

class Task {
  final String description;
  final bool complete;

  Task({this.description = '', this.complete = false});

  Task copyWith({String? description, bool? complete}) {
    return Task(
      description: description ?? this.description,
      complete: complete ?? this.complete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'description': description, 'complete': complete};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      description: map['description'] as String,
      complete: map['complete'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Task(description: $description, complete: $complete)';

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.description == description && other.complete == complete;
  }

  @override
  int get hashCode => description.hashCode ^ complete.hashCode;
}
