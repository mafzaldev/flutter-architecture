import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/domain/entites/user.dart';
import 'package:flutter_architecture/domain/failure/users_list_failure.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}
