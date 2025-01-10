import 'dart:convert';
import 'dart:io';

import 'package:asia_pacific_app/jsonLogin.dart';
import 'package:asia_pacific_app/siteConstant.dart';
import 'package:asia_pacific_app/sqliteDatabaseHelper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JsonProfileMain extends StatefulWidget{

  @override
  JsonProfileState createState() => JsonProfileState();

}

class JsonProfileState extends State<JsonProfileMain>{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sId,sName,sEmail,sContact,sPassword,sGender,sProfile;
  int iGroupValue = 3;
  var nameController,emailController,contactController;
  File? imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() async {
    var sp = await SharedPreferences.getInstance();
    setState(() {
      sId = sp.getString(Siteconstant.USERID) ?? "";
      sName = sp.getString(Siteconstant.NAME) ?? "";
      sEmail = sp.getString(Siteconstant.EMAIL) ?? "";
      sContact = sp.getString(Siteconstant.CONTACT) ?? "";
      sGender = sp.getString(Siteconstant.GENDER) ?? "";
      sProfile = sp.getString(Siteconstant.PROFILE) ?? "";

      nameController = TextEditingController(text: sName);
      emailController = TextEditingController(text: sEmail);
      contactController = TextEditingController(text: sContact);

      if(sGender == "Male"){
        iGroupValue = 0;
      }
      else if(sGender == "Female"){
        iGroupValue = 1;
      }
      else if(sGender == "Transgender"){
        iGroupValue = 2;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Json Profile"),
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
                    GestureDetector(
                      onTap: () {
                        //openGallery();
                        showAlertDialog(context);
                        //Fluttertoast.showToast(msg: "Image Clicked",toastLength: Toast.LENGTH_SHORT);
                      },
                      child: imageFile==null ? 
                        Image.asset("assets/image/login.png",width: 100,height: 100,fit: BoxFit.cover):
                      Image.file(imageFile!,width: 100,height: 100,fit: BoxFit.cover),
                    ),
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
                            insertData(imageFile,sName,sEmail,sContact,sPassword,sGender);
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
                          "Update Profile",
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

  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Camera"),
      onPressed:  () {
        openCamera();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Gallery"),
      onPressed:  () {
        openGallery();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Select Application"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  openGallery() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      setState(() {
          imageFile = File(pickedFile!.path);
      });
    }
  }
  
  openCamera() async{
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedFile!=null){
      setState(() {
          imageFile = File(pickedFile!.path);
      });
    }
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

  insertData(File? imageFile,String sName,String sEmail,String sContact, String sPassword,String sGender) async{
    var sp = await SharedPreferences.getInstance();
    var map = {
      "userid" : sId,
      "name" : sName,
      "email" : sEmail,
      "contact" : sContact,
      "password" : sPassword,
      "gender" : sGender
    };

    if(imageFile!=null){
      var length = await imageFile.length();
      Map<String,String> headerData = {"Accept":"application/json"};
      http.MultipartRequest request = http.MultipartRequest("POST", Uri.parse(Siteconstant.BASE_URL+"updateProfileImage.php"))
      ..headers.addAll(headerData)
      ..fields.addAll(map)
      ..files.add(http.MultipartFile('file',imageFile.openRead(),length,filename: '$sName.jpg'));

      var data = await http.Response.fromStream(await request.send());
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

          sp.setString(Siteconstant.NAME, sName);
          sp.setString(Siteconstant.EMAIL, sEmail);
          sp.setString(Siteconstant.CONTACT, sContact);
          sp.setString(Siteconstant.GENDER, sGender);
          sp.setString(Siteconstant.PROFILE, sProfile);

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
    else{
      var data = await http.post(Uri.parse(Siteconstant.BASE_URL+"updateProfile.php"),body: map);
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

          sp.setString(Siteconstant.NAME, sName);
          sp.setString(Siteconstant.EMAIL, sEmail);
          sp.setString(Siteconstant.CONTACT, sContact);
          sp.setString(Siteconstant.GENDER, sGender);
          sp.setString(Siteconstant.PROFILE, sProfile);

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

}