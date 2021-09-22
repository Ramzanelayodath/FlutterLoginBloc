import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Repository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  void doLogin(String email,String password){
     if(email == ""){
       emit(LoginError("Enter email"));
     }else if(password == ""){
       emit(LoginError("Enter password"));
     }else{
       emit(LoginProcessing());
      repository.doLogin(email, password).then((value){
        if(value){
          emit(LoginSuccess());
        }else{
          emit(LoginError("Invalid Credentials"));
        }
      });

     }
  }


}
