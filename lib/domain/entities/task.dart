import 'package:equatable/equatable.dart';

class Task extends Equatable {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task(
      {this.id,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.startTime,
      this.endTime,
      this.color,
      this.remind,
      this.repeat});

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        isCompleted,
        date,
        startTime,
        endTime,
        color,
        remind,
        repeat,
      ];
}
