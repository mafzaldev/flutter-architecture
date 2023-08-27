import 'package:flutter/material.dart';
import 'package:flutter_architecture/main.dart';
import 'package:flutter_architecture/navigation/app_navigator.dart';
import 'package:flutter_architecture/ui/user_details/user_details_initial_params.dart';
import 'package:flutter_architecture/ui/user_details/user_details_page.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetails(UserDetailsInitialParams initialParams) {
    navigator.push(
        context, UserDetailsPage(cubit: getIt(param1: initialParams)));
  }

  AppNavigator get navigator;
  BuildContext get context;
}
