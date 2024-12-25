import 'package:flutter/material.dart';

class LoginApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginState(),
    );
  }

}

class LoginState extends StatefulWidget{

  @override
  LoginMain createState() => LoginMain();

}

class LoginMain extends State<LoginState>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          child: Image.asset("assets/image/login.png", width: 200.0,height: 200.0,),
        ),
      ),
    );
  }

}