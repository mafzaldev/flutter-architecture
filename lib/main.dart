import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/user_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        children: users
            .map((user) => Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: ListTile(
                    title:
                        Text(user.name, style: const TextStyle(fontSize: 18)),
                    subtitle: Text(user.email),
                    leading: CircleAvatar(
                      child: Text(user.name[0]),
                    ),
                  ),
                ))
            .toList(),
      )),
    );
  }
}
