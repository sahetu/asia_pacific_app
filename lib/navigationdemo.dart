import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Navigationdemo extends StatefulWidget {

  @override
  NavigationState createState() => NavigationState();

}

class NavigationState extends State<Navigationdemo>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tab Demo"),
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: new ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Demo"), 
                accountEmail: Text("demo@gmail.com"),
                currentAccountPicture: Icon(Icons.verified_user),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  showMessage("Home");
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Profile"),
                onTap: (){
                  showMessage("Profile");
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Logout"),
                onTap: (){
                  showMessage("Logout");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showMessage(message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      textColor: Colors.black,
      fontSize: 16.0
    );
  }

}