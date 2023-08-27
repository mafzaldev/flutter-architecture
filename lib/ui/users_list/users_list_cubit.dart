import 'package:flutter_architecture/domain/entites/user.dart';
import 'package:flutter_architecture/domain/repositories/users_repository.dart';
import 'package:flutter_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_navigator.dart';
import 'package:flutter_architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final UsersRepository usersRepository;
  final UsersListNavigator navigator;
  final UsersListInitialParams initialParams;

  UsersListCubit(
    this.initialParams,
    this.usersRepository,
    this.navigator,
  ) : super(UsersListState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true, error: null));
    final usersResponse = await usersRepository.getUsers();
    usersResponse.fold((error) {
      emit(state.copyWith(error: error.error, isLoading: false));
    }, (users) {
      emit(state.copyWith(users: users, isLoading: false));
    });
  }

  onTapUser(User user) {
    navigator.openUserDetails(
      UserDetailsInitialParams(user: user),
    );
  }
}
