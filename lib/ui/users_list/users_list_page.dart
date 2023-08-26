import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_details_page.dart';
import 'package:flutter_architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_initial_params.dart';
import 'package:flutter_architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_architecture/ui/widgets/user_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatefulWidget {
  final UsersListInitialParams initialParams;
  const UsersListPage({super.key, required this.initialParams});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Architecture'),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<UsersListCubit>(context),
          builder: (context, state) {
            state as UsersListState;
            if (state.error != null) {
              return Text(state.error!);
            }
            return state.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: state.users
                        .map(
                          (user) => UserCard(
                            user: user,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailsPage(
                                  initialParams: UserDetailsInitialParams(
                                    user: user,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
