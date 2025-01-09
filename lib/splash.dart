import 'dart:async';

import 'package:asia_pacific_app/bottom.dart';
import 'package:asia_pacific_app/jsonLogin.dart';
import 'package:asia_pacific_app/jsonProfile.dart';
import 'package:asia_pacific_app/login.dart';
import 'package:asia_pacific_app/navigationdemo.dart';
import 'package:asia_pacific_app/siteConstant.dart';
import 'package:asia_pacific_app/sqliteDemo.dart';
import 'package:asia_pacific_app/tabDemo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: SplashApp(),
    );
  }

}

class SplashApp extends StatefulWidget{

  @override
  SplashState createState() => SplashState();

}

class SplashState extends State<SplashApp>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimerMethod();
  }

  Future<Timer> startTimerMethod() async {
      var sp = await SharedPreferences.getInstance();
      var sId = sp.getString(Siteconstant.USERID) ?? "";
      return new Timer(Duration(seconds: 3), (){
        if(sId == ""){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonLoginApp()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonProfileMain()));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("assets/image/login.png",width: 100.0,height: 100.0,),
        ),
      ),
    );
  }
}