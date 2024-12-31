import 'package:asia_pacific_app/custom_list.dart';
import 'package:asia_pacific_app/home.dart';
import 'package:asia_pacific_app/list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginState(),
    );
  }

}

class LoginState extends StatefulWidget{

  @override
  LoginMain createState() => LoginMain();

}

class LoginMain extends State<LoginState>{
  
  GlobalKey<FormState> formKey = GlobalKey();
  late String sEmail,sPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
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
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          print("Login Successfully ${sEmail} & ${sPassword}");
                          Fluttertoast.showToast(
                            msg: "Login Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.amber,
                            textColor: Colors.black,
                            fontSize: 16.0
                          );
                          //Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeState(sEmail,sPassword)));
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>CustomList()));
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
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }

}