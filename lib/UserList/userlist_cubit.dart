import 'package:bloc/bloc.dart';
import 'package:flutterloginbloc/UserList/data/model/UserListModel.dart';
import 'package:meta/meta.dart';

import '../Repository.dart';

part 'userlist_state.dart';

class UserlistCubit extends Cubit<UserlistState> {

  final Repository repository;
  UserlistCubit(this.repository) : super(UserlistInitial());

  void fetchUserList(){
    repository.fetchUserList().then((value){
      emit(UserListLoaded(value!));
    });
  }


}
