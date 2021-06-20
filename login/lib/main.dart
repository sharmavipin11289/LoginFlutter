import 'package:flutter/material.dart';
import 'package:login/ApiService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 final emailText = TextEditingController();
 final passwordText = TextEditingController();

  //MARK:API Call 
  callLoginApi() {
    final service = ApiServices();
    
     service.apiCallLogin(
        {
          "email": emailText.text,
          "password": passwordText.text,
        },
      ).then((value){
          if(value.error != null){
            print("get data >>>>>> " + value.error!);
          }else{
            print(value.token!);
            //push
          }
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailText,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Email/Phone',
              hintText: 'Enter Your Register Email',
            ),
          ),
          TextField(
            obscureText: true,
            controller: passwordText,
            decoration: InputDecoration(
              labelText: 'password',
              hintText: 'Enter Your Password',
            ),
          ),
          TextButton(
            onPressed: () {
              callLoginApi();
            },
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }
}
