// Remote data operations for user_list
import 'package:flutter_clean_api/core/http_client.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';

class UsersRemoteDataSource {
  final String url;

  UsersRemoteDataSource({required this.url});
  Future<List<UserEntity>> getUsers() async {
    List<UserEntity> res = await HttpClient(baseUrl: url).get();
    return res;
  }
}
