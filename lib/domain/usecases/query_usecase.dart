import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/core/error/failure.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

class GetQueryUseCase {
  final BaseToDoRepository baseToDoRepository;
  GetQueryUseCase(this.baseToDoRepository);

  Future<Either<Failure, List<Map<String, dynamic>>>> call() async {
    return await baseToDoRepository.getQueries();
  }
}
