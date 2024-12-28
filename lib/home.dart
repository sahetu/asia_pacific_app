import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeState extends StatefulWidget{

  String sEmail,sPassword;

  HomeState(this.sEmail,this.sPassword);

  @override
  HomeMain createState() => HomeMain();

}

class HomeMain extends State<HomeState>{

  int iGroupValue = 3;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.amber.shade100,
                      child: Text(
                        "Email Id : ", 
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.amber.shade200,
                      child: Text(
                        widget.sEmail, 
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.amber.shade100,
                      child: Text(
                        "Password : ", 
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.amber.shade200,
                      child: Text(
                        widget.sPassword, 
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        value: 0, 
                        groupValue: iGroupValue, 
                        onChanged: (value){
                          setState(() {
                            setGender(value,"Male");  
                          });
                        }
                      ),
                      Text("Male",style: TextStyle(color: Colors.black,fontSize: 15.0),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        value: 1, 
                        groupValue: iGroupValue, 
                        onChanged: (value){
                          setState(() {
                            setGender(value,"Female");  
                          });
                        }
                      ),
                      Text("Female",style: TextStyle(color: Colors.black,fontSize: 15.0),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(
                        value: 2, 
                        groupValue: iGroupValue, 
                        onChanged: (value){
                          setState(() {
                            setGender(value,"Transgender");  
                          });
                        }
                      ),
                      Text("Transgender",style: TextStyle(color: Colors.black,fontSize: 15.0),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setGender(value,message){
    iGroupValue = value;
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