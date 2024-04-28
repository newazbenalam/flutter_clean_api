import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';

abstract class UsersListRepository {
  Future<List<UserEntity>> getUsers();
}
