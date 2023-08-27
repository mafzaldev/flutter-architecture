import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/users_list/users_list_cubit.dart';
import 'package:flutter_architecture/ui/users_list/users_list_state.dart';
import 'package:flutter_architecture/ui/widgets/user_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatefulWidget {
  final UsersListCubit cubit;
  const UsersListPage({super.key, required this.cubit});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  UsersListCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

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
          bloc: cubit,
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
                            onTap: () => cubit.onTapUser(user),
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
