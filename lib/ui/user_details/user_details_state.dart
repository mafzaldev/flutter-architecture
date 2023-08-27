import 'package:flutter_architecture/domain/entites/user.dart';
import 'package:flutter_architecture/ui/user_details/user_details_initial_params.dart';

class UserDetailsState {
  final User user;

  const UserDetailsState({
    required this.user,
  });

  factory UserDetailsState.initial(
          {required UserDetailsInitialParams initialParams}) =>
      UserDetailsState(user: initialParams.user);

  UserDetailsState copyWith({
    User? user,
  }) {
    return UserDetailsState(
      user: user ?? this.user,
    );
  }
}
