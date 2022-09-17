import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String? title;
  final String? note;
  final int? isCompleted;
  final String? date;
  final String? startTime;
  final String? endTime;
  final int? color;
  final int? remind;
  final String? repeat;

  const Task(
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
