import 'package:flutter/material.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';
import 'package:flutter_clean_api/features/user_list/presentation/providers/user_list_provider.dart';
import 'package:flutter_clean_api/features/user_list/presentation/screens/user_detail.dart';
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
        body: context.watch<UsersListProvider>().userList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: context.watch<UsersListProvider>().userList.length,
                itemBuilder: (context, index) {
                  UserEntity item =
                      context.watch<UsersListProvider>().userList[index];
                  if (item.image!.isEmpty) {
                    item.image =
                        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=180';
                  }

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserDetailScreen(
                          user: item,
                        ),
                      ));
                    },
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(item.image.toString()),
                    ),
                    title: Text(item.name.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.actor.toString()),
                        Text(
                          item.house.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<UsersListProvider>().getUsersData();
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
