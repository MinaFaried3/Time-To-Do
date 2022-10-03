import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../../core/error/failure.dart';

class DeleteAllUseCase {
  final BaseToDoRepository baseToDoRepository;

  DeleteAllUseCase(this.baseToDoRepository);

  Future<Either<Failure, int>> call() async {
    return await baseToDoRepository.deleteAll();
  }
}
