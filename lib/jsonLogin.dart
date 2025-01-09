import 'dart:convert';

import 'package:asia_pacific_app/custom_list.dart';
import 'package:asia_pacific_app/home.dart';
import 'package:asia_pacific_app/jsonProfile.dart';
import 'package:asia_pacific_app/jsonSignup.dart';
import 'package:asia_pacific_app/list.dart';
import 'package:asia_pacific_app/siteConstant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JsonLoginApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonLoginState(),
    );
  }

}

class JsonLoginState extends StatefulWidget{

  @override
  JsonLoginMain createState() => JsonLoginMain();

}

class JsonLoginMain extends State<JsonLoginState>{
  
  GlobalKey<FormState> formKey = GlobalKey();
  late String sEmail,sPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Login Page"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.asset("assets/image/login.png", width: 200.0,height: 200.0,),              
              Form(
                key: formKey,
                child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Id",
                        hintText: "Email Id",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                        focusColor: Colors.amber.shade100,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        prefixIcon: Icon(Icons.email)
                      ),
                      onSaved: (value){
                        sEmail = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email Id Required";
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                        focusColor: Colors.amber.shade100,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        prefixIcon: Icon(Icons.password)
                      ),
                      onSaved: (value){
                        sPassword = value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password Required";
                        }
                        else{
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 40.0,
                    color: Colors.blueAccent.shade200,
                    child: TextButton(
                      onPressed: () async {
                        var connectivity = await(Connectivity().checkConnectivity());
                        if(connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            loginData(sEmail,sPassword);
                          }
                        }
                        else{
                          Fluttertoast.showToast(
                          gravity: ToastGravity.BOTTOM,
                          msg:'Internet/Wifi Disconnected', 
                          toastLength: Toast.LENGTH_LONG);
                        }
                      }, 
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 40.0,
                    color: Colors.blueAccent.shade200,
                    child: TextButton(
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonSignupMain()));
                      }, 
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }

  loginData(String sEmail,String sPassword) async{
    var sp = await SharedPreferences.getInstance();
    var map = {
      "email" : sEmail,
      "password" : sPassword
    };

    var data = await http.post(Uri.parse(Siteconstant.BASE_URL+"login.php"),body: map);
    if(data.statusCode == 200){
      var jsonData = jsonDecode(data.body);
      if(jsonData["status"] == true){
        Fluttertoast.showToast(
          msg: jsonData["messsage"],
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 2,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 16.0
        );
        
        sp.setString(Siteconstant.USERID, jsonData["UserDetails"]["userid"]);
        sp.setString(Siteconstant.NAME, jsonData["UserDetails"]["name"]);
        sp.setString(Siteconstant.EMAIL, jsonData["UserDetails"]["email"]);
        sp.setString(Siteconstant.CONTACT, jsonData["UserDetails"]["contact"]);
        sp.setString(Siteconstant.GENDER, jsonData["UserDetails"]["gender"]);
        sp.setString(Siteconstant.PROFILE, jsonData["UserDetails"]["profile"]);
        Navigator.push(context, MaterialPageRoute(builder: (_)=>JsonProfileMain()));
      }
      else{
        Fluttertoast.showToast(
          msg: jsonData["messsage"],
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 2,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          fontSize: 16.0
        );
      }
    }
    else{
      Fluttertoast.showToast(
        msg: "Server Error Code ${data.statusCode}",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.amber,
        textColor: Colors.black,
        fontSize: 16.0
      );
    }

  }

}