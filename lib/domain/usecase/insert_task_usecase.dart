import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

import '../../data/model/task_model.dart';

class InsertTaskUseCase {
  BaseToDoRepository baseToDoRepository;
  InsertTaskUseCase(this.baseToDoRepository);

  Future<int> call(TaskModel task) async {
    return await baseToDoRepository.insertTask(task);
  }
}
