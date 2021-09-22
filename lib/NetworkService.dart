
import 'dart:convert';

import 'package:flutterloginbloc/Urls.dart';
import 'package:http/http.dart' as http;

import 'UserList/data/model/UserListModel.dart';
class NetworkService{


  Future<bool> doLogin(String email,String password)async{
    var repsonse = await http.post(Uri.parse(Urls.Login_API), headers: {"Content-Type": "application/json"},
        body:json.encode(
          {
            "email" : email,
            "password" : password
          }

        ));
    if(repsonse.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  Future<List<Data>?> fetchUsers()async{
     try{
       var response = await http.get(Uri.parse(Urls.USER_LIST_API));
       if(response.statusCode == 200){
         var data = json.decode(response.body);
         List<Data> userList = UserListModel.fromJson(data).data;
         return userList;
       }else{
         throw Exception();
       }

     }catch(e){
       return null;
     }
    
  }


}