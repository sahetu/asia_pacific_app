import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget{

  @override
  ListState createState() => ListState();

}

class ListState extends State<ListDemo>{

  List<String> titleArray = ["Android","iOS","Flutter","React Native"];
  List<String> subTitleArray = ["Smart Phone","iPhone","Google","Facebook"];
  List<String> leadingArray = ["assets/image/login.png","assets/image/login.png","assets/image/login.png","assets/image/login.png"];
  List<String> trailingArray = ["assets/image/login.png","assets/image/login.png","assets/image/login.png","assets/image/login.png"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: titleArray.length,
          itemBuilder: (BuildContext context, int position){
            return ListTile(
              title: Text(titleArray[position]),
              subtitle: Text(subTitleArray[position]),
              leading: Container(width: 50.0,height: 50.0,child: Image.asset(leadingArray[position])),
              trailing: Image.asset(trailingArray[position]),
              onTap: (){
                print(titleArray[position]);
              },
            );
          }
        ),
    );
  }

}