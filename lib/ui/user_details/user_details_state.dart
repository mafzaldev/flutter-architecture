import 'package:flutter_architecture/domain/entites/user.dart';

class UserDetailsState {
  final User user;

  const UserDetailsState({
    required this.user,
  });

  factory UserDetailsState.initial() =>
      const UserDetailsState(user: User.empty());

  UserDetailsState copyWith({
    User? user,
  }) {
    return UserDetailsState(
      user: user ?? this.user,
    );
  }
}
