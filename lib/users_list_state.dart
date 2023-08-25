import 'package:flutter_architecture/user_model.dart';

class UsersListState {
  final List<UserModel> users;
  final bool isLoading;
  const UsersListState({required this.users, required this.isLoading});

  factory UsersListState.empty() =>
      const UsersListState(users: [], isLoading: false);

  UsersListState copyWith({List<UserModel>? users, bool? isLoading}) {
    return UsersListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
