// Repository implementation for user_list
import 'package:flutter_clean_api/features/user_list/data/data_sources/users_remote_data_source.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';
import 'package:flutter_clean_api/features/user_list/domain/repositories/user_list_repository.dart';

class UsersListRepositoryImp implements UsersListRepository {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersListRepositoryImp({required this.usersRemoteDataSource});

  @override
  Future<List<UserEntity>> getUsers() async {
    return await usersRemoteDataSource.getUsers();
  }
}
