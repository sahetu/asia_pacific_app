import 'package:asia_pacific_app/list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomList extends StatefulWidget{

  @override
  CustomListState createState() => CustomListState();

}

class CustomListState extends State<CustomList>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom List"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: CustomListDesign(),
        ),
      ),
    );
  }

}

class CustomListDesign extends StatelessWidget{

  List<String> titleArray = ["Android","iOS","Flutter","React Native"];
  List<String> subTitleArray = ["Smart Phone","iPhone","Google","Facebook"];
  List<String> leadingArray = ["assets/image/login.png","assets/image/login.png","assets/image/login.png","assets/image/login.png"];
  List<String> tutorProfileArray = ["assets/image/login.png","assets/image/login.png","assets/image/login.png","assets/image/login.png"];
  List<String> tutorNameArray = ["David Marc","David Marc","David Marc","David Marc"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return ListView.builder(
      itemCount: titleArray.length,
      itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          child: Card(
            elevation: 3.0,
            child: Column(
              children: [
                Row(
                  children: [
                    
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(
                            msg: "Image Clicked",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.amber,
                            textColor: Colors.black,
                            fontSize: 16.0
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ListDemo()));
                      },
                      child: Image.asset(leadingArray[index],width: 100.0,height: 100.0,)),
                    Column(
                      children: [
                        Text(titleArray[index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text(subTitleArray[index],style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(leadingArray[index],width: 30.0,height: 30.0,),
                    Text(titleArray[index],style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }

}