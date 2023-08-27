import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/data/user_model.dart';
import 'package:flutter_architecture/domain/entites/user.dart';
import 'package:flutter_architecture/domain/failure/users_list_failure.dart';
import 'package:flutter_architecture/domain/repositories/users_repository.dart';
import 'package:flutter_architecture/network/network_repository.dart';

class RestApiUsersRepository implements UsersRepository {
  final NetworkRepository _networkRepository;

  RestApiUsersRepository(this._networkRepository);

  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() =>
      _networkRepository.get('https://jsonplaceholder.typicode.com/users').then(
            (value) => value.fold(
              (l) => left(UsersListFailure(error: l.error)),
              (r) {
                var list = r as List;
                return right(
                    list.map((e) => UserModel.fromJson(e).toDomain()).toList());
              },
            ),
          );
}
