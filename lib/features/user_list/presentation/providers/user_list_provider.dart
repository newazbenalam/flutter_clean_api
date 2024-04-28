import 'package:flutter/material.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';
import 'package:flutter_clean_api/features/user_list/domain/use_cases/get_users_usecase.dart';

class UsersListProvider extends ChangeNotifier {
  final GetUsersUsecase getUsersUsecase;

  UsersListProvider({required this.getUsersUsecase});

  static List<UserEntity> _usersList = [];

  List<UserEntity> get userList => _usersList;

  void onInit() {
    getUsersData();
  }

  void getUsersData() async {
    try {
      _usersList = await getUsersUsecase.getUsersList();
      notifyListeners();
    } catch (e) {
      // Handle error
      debugPrint('Error fetching users data: $e');
    }
  }
}
