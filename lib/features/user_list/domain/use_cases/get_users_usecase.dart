import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';
import 'package:flutter_clean_api/features/user_list/domain/repositories/user_list_repository.dart';

class GetUsersUsecase {
  final UsersListRepository usersListRepository;

  GetUsersUsecase({required this.usersListRepository});

  Future<List<UserEntity>> getUsersList() async {
    return await usersListRepository.getUsers();
  }
}
