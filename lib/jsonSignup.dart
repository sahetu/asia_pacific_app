import 'package:asia_pacific_app/sqliteDatabaseHelper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JsonSignupMain extends StatefulWidget{

  @override
  JsonSignupState createState() => JsonSignupState();

}

class JsonSignupState extends State<JsonSignupMain>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sName,sEmail,sContact,sPassword,sGender;
  int iGroupValue = 3;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json Signup"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Name",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                          focusColor: Colors.amber.shade100,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                          prefixIcon: Icon(Icons.person)
                        ),
                        onSaved: (value){
                          sName = value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Name Required";
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
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: "Contact No.",
                          hintText: "Contact No.",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),),
                          focusColor: Colors.amber.shade100,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                          prefixIcon: Icon(Icons.call)
                        ),
                        onSaved: (value){
                          sContact = value!;
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return "Contact No. Required";
                          }
                          if(value!.length<10){
                            return "Valid Contact No. Required";
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
                    Container(
                      width: 100.0,
                      height: 40.0,
                      color: Colors.blueAccent.shade200,
                      child: TextButton(
                        onPressed: () async{
                          var connectivity = await(Connectivity().checkConnectivity());
                        if(connectivity == ConnectivityResult.wifi || connectivity == ConnectivityResult.mobile){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            //insertData(sName,sEmail,sContact,sPassword);
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
      ),
    );
  }

  void setGender(value,message){
    iGroupValue = value;
    sGender = message;
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