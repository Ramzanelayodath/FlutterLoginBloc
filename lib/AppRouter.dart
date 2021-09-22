

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterloginbloc/Login/login_cubit.dart';
import 'package:flutterloginbloc/Settings.dart';
import 'package:flutterloginbloc/UserList/UserList.dart';
import 'package:flutterloginbloc/UserList/userlist_cubit.dart';

import 'Login/Login.dart';
import 'NetworkService.dart';
import 'Repository.dart';

class AppRouter{
  late Repository repository;
  AppRouter() {
    repository = Repository(NetworkService());

  }
  Route? generateRoute(RouteSettings settings){

    switch(settings.name){
      case "/" :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>LoginCubit(repository),
          child: Login(),
        )
        );
      case USER_LIST :
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>UserlistCubit(repository),
          child: UserList(),
        )
        );
      default :
        return null;
    }
  }
}