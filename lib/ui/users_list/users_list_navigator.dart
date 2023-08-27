import 'package:flutter/material.dart';
import 'package:flutter_architecture/main.dart';
import 'package:flutter_architecture/navigation/app_navigator.dart';
import 'package:flutter_architecture/ui/user_details/user_details_navigator.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_page.dart';

class UsersListNavigator with UserDetailsRoute {
  UsersListNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin UsersListRoute {
  openUsersList(UsersListInitialParams initialParams) {
    navigator.push(
      context,
      UsersListPage(
        cubit: getIt(param1: initialParams),
      ),
    );
  }

  AppNavigator get navigator;
  BuildContext get context;
}
