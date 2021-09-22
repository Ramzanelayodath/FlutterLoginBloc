import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterloginbloc/AppRouter.dart';
import 'package:flutterloginbloc/Login/login_cubit.dart';
import 'package:flutterloginbloc/Settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Login extends StatelessWidget {

  TextEditingController ctrl_username = TextEditingController();
  TextEditingController ctrl_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Login'
        ),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccess){
            pr.hide();
            Navigator.pushNamed(context, USER_LIST);
          }else if(state is LoginError){
            pr.hide();
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }else if(state is LoginProcessing){
            pr.show();
          }
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                controller: ctrl_username,
                decoration: InputDecoration(
                    hintText: "Username"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                controller: ctrl_password,
                decoration: InputDecoration(
                    hintText: "Password"
                ),
              ),
              SizedBox(height: 25,),
              GestureDetector(
                child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(
                      child: Text('Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),),
                    )
                ),
                onTap: () {
                  BlocProvider.of<LoginCubit>(context).doLogin(
                      ctrl_username.text.toString(),
                      ctrl_password.text.toString());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}