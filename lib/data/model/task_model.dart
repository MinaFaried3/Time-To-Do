import 'package:todo_clean_architecture/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel(
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
}
