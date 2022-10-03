import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../../core/error/failure.dart';

class CompleteTaskUseCase {
  final BaseToDoRepository baseToDoRepository;

  CompleteTaskUseCase(this.baseToDoRepository);

  Future<Either<Failure, int>> call(int id) async {
    return await baseToDoRepository.completeTask(id);
  }
}
