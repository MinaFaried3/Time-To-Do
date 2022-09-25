import 'package:todo_clean_architecture/domain/repository/base_to_do_repository.dart';

class DeleteAllUseCase {
  final BaseToDoRepository baseToDoRepository;

  DeleteAllUseCase(this.baseToDoRepository);

  Future<int> call() async {
    return await baseToDoRepository.deleteAll();
  }
}
