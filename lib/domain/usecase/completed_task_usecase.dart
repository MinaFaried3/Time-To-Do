import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

class CompleteTask {
  final BaseToDoRepository baseToDoRepository;

  CompleteTask(this.baseToDoRepository);

  Future<int> call(int id) async {
    return await baseToDoRepository.completeTask(id);
  }
}
