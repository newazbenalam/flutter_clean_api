// Remote data operations for user_list
import 'package:flutter/material.dart';
import 'package:flutter_clean_api/core/http_client.dart';
import 'package:flutter_clean_api/features/user_list/data/models/user_model.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';

class UsersRemoteDataSource {
  final String url;

  UsersRemoteDataSource({required this.url});
  Future<List<UserEntity>> getUsers() async {
    debugPrint('starting!!');
    final List<dynamic> res = await HttpClient(baseUrl: url).get();
    debugPrint('Fetching users data: $res');
    return res.map((json) => UsersModel.fromJson(json)).toList();
  }
}
