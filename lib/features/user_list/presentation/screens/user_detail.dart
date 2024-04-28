import 'package:flutter/material.dart';
import 'package:flutter_clean_api/features/user_list/domain/entities/users_entity.dart';

class UserDetailScreen extends StatelessWidget {
  final UserEntity user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 75,
                foregroundImage: NetworkImage(user.image.toString()),
              ),
            ),
            const SizedBox(height: 24),
            profileCard('Name', user.name.toString()),
            profileCard('Actor', user.actor.toString()),
            profileCard('Species', user.species.toString()),
            profileCard('Gender', user.gender.toString()),
            profileCard('House', user.house.toString()),
            profileCard('Date of Birth', user.dateOfBirth.toString()),
            profileCard('Year of Birth', user.yearOfBirth.toString()),
            profileCard('Wizard', user.wizard.toString()),
            profileCard('Ancestry', user.ancestry.toString()),
            profileCard('Eye Colour', user.eyeColour.toString()),
            profileCard('Hair Colour', user.hairColour.toString()),
            profileCard('Patronus', user.patronus.toString()),
            profileCard('Hogwarts Student', user.hogwartsStudent.toString()),
            profileCard('Hogwarts Staff', user.hogwartsStaff.toString()),
            profileCard('Alternate Actors', user.alternateActors.join(", ")),
            profileCard('Alive', user.alive.toString()),
          ],
        ),
      ),
    );
  }

  Widget profileCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
