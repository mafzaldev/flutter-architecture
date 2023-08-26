import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/rest_api_users_repository.dart';
import 'package:flutter_architecture/domain/repositories/users_repository.dart';
import 'package:flutter_architecture/ui/user_details/user_details_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository());
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => UsersListCubit(getIt())..fetchUsers(),
    ),
    BlocProvider(
      create: (context) => UserDetailsCubit(),
    ),
  ], child: const MyApp()));
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
        initialParams: UsersListInitialParams(),
      ),
    );
  }
}
