part of 'userlist_cubit.dart';




@immutable
abstract class UserlistState {
}

class UserlistInitial extends UserlistState {}

class UserListLoaded extends UserlistState{
  List<Data> userList;

  UserListLoaded(this.userList);
}


