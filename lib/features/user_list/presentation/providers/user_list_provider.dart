import 'package:flutter/material.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';
import 'package:flutter_clean_api/features/user_list/domain/use_cases/get_users_usecase.dart';

class UsersListProvider extends ChangeNotifier {
  final GetUsersUsecase getUsersUsecase;

  UsersListProvider({required this.getUsersUsecase}) {
    getUsersData();
  }

  static List<UserEntity> _usersList = [];

  List<UserEntity> get userList => _usersList;

  void getUsersData() async {
    _usersList = [];
    notifyListeners();
    try {
      _usersList = await getUsersUsecase.getUsersList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching users data: $e');
    }
  }
}
