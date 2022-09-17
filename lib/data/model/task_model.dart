import 'package:todo_clean_architecture/domain/entities/task.dart';

class TaskModel extends Task {
  const TaskModel(
      {super.id,
      super.title,
      super.note,
      super.isCompleted,
      super.date,
      super.startTime,
      super.endTime,
      super.color,
      super.remind,
      super.repeat});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      isCompleted: json['isCompleted'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color'],
      remind: json['remind'],
      repeat: json['repeat'],
    );
  }
}
