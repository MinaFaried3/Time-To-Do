import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

class CompleteTaskUseCase {
  final BaseToDoRepository baseToDoRepository;

  CompleteTaskUseCase(this.baseToDoRepository);

  Future<int> call(int id) async {
    return await baseToDoRepository.completeTask(id);
  }
}
