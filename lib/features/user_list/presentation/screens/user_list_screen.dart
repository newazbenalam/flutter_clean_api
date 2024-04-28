import 'package:flutter/material.dart';
import 'package:flutter_clean_api/features/user_list/presentation/providers/user_list_provider.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  final String title;
  const UserListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: context.watch<UsersListProvider>().userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(context
                .watch<UsersListProvider>()
                .userList[index]
                .name
                .toString()),
          );
        },
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            context.read<UsersListProvider>().getUsersData();
          },
          icon: const Icon(Icons.refresh)),
    );
  }
}
