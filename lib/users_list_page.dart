import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/user_model.dart';
import 'package:flutter_architecture/widgets/user_card.dart';
import 'package:http/http.dart' as http;

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final List<UserModel> users = [];

  _fetchUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    users.addAll(list.map((e) => UserModel.fromJson(e)).toList());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Architecture'),
      ),
      body: Center(
          child: ListView(
        children: users.map((user) => UserCard(user: user)).toList(),
      )),
    );
  }
}
