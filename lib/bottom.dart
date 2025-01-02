import 'package:asia_pacific_app/call.dart';
import 'package:asia_pacific_app/chat.dart';
import 'package:asia_pacific_app/status.dart';
import 'package:flutter/material.dart';

class BottomDemo extends StatefulWidget{

  @override
  BottomState createState() => BottomState();

}

class BottomState extends State<BottomDemo>{
  
  var tabArray = [ChatDemo(),StatusDemo(),CallDemo()];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: tabArray[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              label: "Profile"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: "Logout"
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (index){
            clickMethod(index);
          },
        ),
      ),
    );
  }

  clickMethod(index){
    setState(() {
      selectedIndex = index;
    });
  }

}