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
  bool androidCheck = false;
  bool iosCheck = false;
  bool flutterCheck = false;
  bool reactCheck = false;
  List<String> technologyArray = [];

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
            Row(
              children: [
                Checkbox(
                  value: androidCheck, 
                  onChanged: (value){
                    setState(() {
                      androidCheck = value!;
                      technologyMethod(value,"Android");  
                    });                  
                  }
                ),
                Text(
                  "Android",
                  style: TextStyle(color: Colors.black,fontSize: 15.0),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: iosCheck, 
                  onChanged: (value){
                    setState(() {
                      iosCheck = value!;
                      technologyMethod(value,"iOS");  
                    });
                  }
                ),
                Text(
                  "iOS",
                  style: TextStyle(color: Colors.black,fontSize: 15.0),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: flutterCheck, 
                  onChanged: (value){
                    setState(() {
                      flutterCheck = value!;
                      technologyMethod(value,"Flutter");  
                    });
                  }
                ),
                Text(
                  "Flutter",
                  style: TextStyle(color: Colors.black,fontSize: 15.0),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: reactCheck, 
                  onChanged: (value){
                    setState(() {
                      reactCheck = value!;
                      technologyMethod(value,"React Native");  
                    });
                  }
                ),
                Text(
                  "React Native",
                  style: TextStyle(color: Colors.black,fontSize: 15.0),
                )
              ],
            ),
            Container(
              width: 200.0,
              height: 40.0,
              color: Colors.amber.shade100,
              child: TextButton(
                onPressed: (){
                  if(technologyArray.length>0){
                    print(technologyArray);
                  }
                }, 
                child: Text("Show Technology")
              )
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

  technologyMethod(isSelect,technology){
    if(isSelect){
      //print(technology);
      technologyArray.add(technology);
    }
    else{
      // for(int i=0;i<technologyArray.length;i++){
      //   if(technologyArray[i] == technology){
      //     technologyArray.remove(i);
      //   }
      // }
      technologyArray.removeWhere((element) => element == technology);
    }
  }

}