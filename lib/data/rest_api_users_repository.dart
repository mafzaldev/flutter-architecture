import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/data/user_model.dart';
import 'package:flutter_architecture/domain/entites/user.dart';
import 'package:flutter_architecture/domain/failure/users_list_failure.dart';
import 'package:flutter_architecture/domain/repositories/users_repository.dart';
import 'package:http/http.dart' as http;

class RestApiUsersRepository implements UsersRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      var list = jsonDecode(response.body) as List;
      return right(list.map((e) => UserModel.fromJson(e).toDomain()).toList());
    } catch (ex) {
      return left(UsersListFailure(error: ex.toString()));
    }
  }
}
