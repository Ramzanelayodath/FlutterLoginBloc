

import 'NetworkService.dart';
import 'UserList/data/model/UserListModel.dart';

class Repository{
  final NetworkService networkService;

  Repository(this.networkService);

  Future<bool> doLogin(String email,String password) async{
    final islogin = await networkService.doLogin(email, password);
    return islogin;
  }

  Future<List<Data>?> fetchUserList()async{
      final userList = networkService.fetchUsers();
      return userList;
  }

}