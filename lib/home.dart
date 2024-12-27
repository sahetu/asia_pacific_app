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
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home"),
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
                      color: Colors.blueGrey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Email Id"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blueGrey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(widget.sEmail, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                      color: Colors.blueGrey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Password"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blueGrey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(widget.sPassword, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                      Radio(value: 0, groupValue: iGroupValue, onChanged: (value){
                        setState(() {
                          setGender(value,"Male");                          
                        });
                      }),
                      Text("Male")
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(value: 1, groupValue: iGroupValue, onChanged: (value){
                        setState(() {
                          setGender(value,"Female");  
                        });
                        
                      }),
                      Text("Female")
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Radio(value: 2, groupValue: iGroupValue, onChanged: (value){
                        setState(() {
                          setGender(value,"Trangender");  
                        });
                        
                      }),
                      Text("Transgender")
                    ],
                  ),
                ),
              ],
            )

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