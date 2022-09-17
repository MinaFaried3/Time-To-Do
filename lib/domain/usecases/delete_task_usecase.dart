import 'package:todo_clean_architecture/data/model/task_model.dart';
import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

class DeleteTaskUseCase {
  final BaseToDoRepository baseToDoRepository;

  DeleteTaskUseCase(this.baseToDoRepository);

  Future<int> call(TaskModel task) async {
    return await baseToDoRepository.deleteTask(task);
  }
}
