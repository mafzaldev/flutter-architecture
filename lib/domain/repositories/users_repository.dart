import 'package:flutter_architecture/domain/entites/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
