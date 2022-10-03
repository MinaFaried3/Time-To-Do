import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/error/failure.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../../data/model/task_model.dart';

class InsertTaskUseCase {
  BaseToDoRepository baseToDoRepository;
  InsertTaskUseCase(this.baseToDoRepository);

  Future<Either<Failure, int>> call(TaskModel task) async {
    return await baseToDoRepository.insertTask(task);
  }
}
