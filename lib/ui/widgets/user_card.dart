import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/entites/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        title: Text(user.name, style: const TextStyle(fontSize: 18)),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          child: Text(user.name[0]),
        ),
      ),
    );
  }
}
