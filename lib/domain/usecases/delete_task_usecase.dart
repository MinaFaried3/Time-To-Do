import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/data/model/task_model.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../../core/error/failure.dart';

class DeleteTaskUseCase {
  final BaseToDoRepository baseToDoRepository;

  DeleteTaskUseCase(this.baseToDoRepository);

  Future<Either<Failure, int>> call(TaskModel task) async {
    return await baseToDoRepository.deleteTask(task);
  }
}
