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
}
