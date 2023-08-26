import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/user_details/user_details_cubit.dart';
import 'package:flutter_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  final UserDetailsInitialParams initialParams;

  const UserDetailsPage({super.key, required this.initialParams});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late UserDetailsCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<UserDetailsCubit>(context);
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              state as UserDetailsState;
              return ListTile(
                title: Text(state.user.name),
                subtitle: Text(state.user.email),
              );
            }),
      ),
    );
  }
}
