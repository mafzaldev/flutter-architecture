import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/rest_api_users_repository.dart';
import 'package:flutter_architecture/domain/repositories/users_repository.dart';
import 'package:flutter_architecture/navigation/app_navigator.dart';
import 'package:flutter_architecture/ui/user_details/user_details_cubit.dart';
import 'package:flutter_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_navigator.dart';
import 'package:flutter_architecture/ui/users_list/users_list_page.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));
  getIt.registerFactoryParam<UsersListCubit, UsersListInitialParams, dynamic>(
      (params, _) => UsersListCubit(params, getIt(), getIt()));
  getIt.registerFactoryParam<UserDetailsCubit, UserDetailsInitialParams,
      dynamic>((params, _) => UserDetailsCubit(params));

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
      home: UsersListPage(
        cubit: getIt(param1: UsersListInitialParams()),
      ),
    );
  }
}
