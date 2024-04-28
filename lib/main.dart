import 'package:flutter/material.dart';
import 'package:flutter_clean_api/features/user_list/data/data_sources/users_remote_data_source.dart';
import 'package:flutter_clean_api/features/user_list/data/repositories/user_list_repository_impl.dart';
import 'package:flutter_clean_api/features/user_list/domain/use_cases/get_users_usecase.dart';
import 'package:flutter_clean_api/features/user_list/presentation/providers/user_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_clean_api/features/user_list/presentation/screens/user_list_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UsersListProvider(
          getUsersUsecase: GetUsersUsecase(
              usersListRepository: UsersListRepositoryImp(
                  usersRemoteDataSource: UsersRemoteDataSource(
                      url: 'https://hp-api.onrender.com/api/characters')))),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CleanApi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserListScreen(title: 'Characters'),
    );
  }
}
