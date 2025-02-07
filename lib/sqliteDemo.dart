import 'package:asia_pacific_app/sqliteDatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SqliteListState extends StatelessWidget{

  GlobalKey<FormState> formKey = GlobalKey();
  late String sName,sEmail,sContact,sPassword;
  var dbHelper = SqliteDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sqlite Database"),
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
                    Container(
                      width: 100.0,
                      height: 40.0,
                      color: Colors.blueAccent.shade200,
                      child: TextButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            insertData(sName,sEmail,sContact,sPassword);
                          }
                        }, 
                        child: Text(
                          "Insert",
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
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
                            updateData(sName,sEmail,sContact,sPassword);
                          }
                        }, 
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 40.0,
                      color: Colors.blueAccent.shade200,
                      child: TextButton(
                        onPressed: (){
                          formKey.currentState!.save();
                          deleteData(sContact);
                        }, 
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 40.0,
                      color: Colors.blueAccent.shade200,
                      child: TextButton(
                        onPressed: (){
                          showData();
                        }, 
                        child: Text(
                          "All Data",
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 40.0,
                      color: Colors.blueAccent.shade200,
                      child: TextButton(
                        onPressed: (){
                          formKey.currentState!.save();
                          searchData(sContact);
                        }, 
                        child: Text(
                          "Search",
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

  void insertData(String sName,String sEmail,String sContact, String sPassword) async{
    Map<String,dynamic> rows = {
      SqliteDatabaseHelper.columnName:sName,
      SqliteDatabaseHelper.columnEmail:sEmail,
      SqliteDatabaseHelper.columnContact:sContact,
      SqliteDatabaseHelper.columnPassword:sPassword
    };

    final id  = await dbHelper.insert(rows);
    Fluttertoast.showToast(
      msg: "Insert Successfully",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      textColor: Colors.black,
      fontSize: 16.0
    );
    print("Last Inserted Id : $id");

  }

  void updateData(String sName,String sEmail,String sContact, String sPassword) async{
    Map<String,dynamic> rows = {
      SqliteDatabaseHelper.columnName:sName,
      SqliteDatabaseHelper.columnEmail:sEmail,
      SqliteDatabaseHelper.columnPassword:sPassword
    };

    final id  = await dbHelper.update(rows,sContact);
    Fluttertoast.showToast(
      msg: "Update Successfully",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      textColor: Colors.black,
      fontSize: 16.0
    );
    print("Updated Id : $id");

  }

  void deleteData(String sContact) async{
    final id  = await dbHelper.delete(sContact);
    Fluttertoast.showToast(
      msg: "Delete Successfully",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      textColor: Colors.black,
      fontSize: 16.0
    );
    print("Deleted Id : $id");

  }

  void showData() async{
    var listData = await dbHelper.getAllData();
    for(var i=0;i<listData.length;i++){
      print(listData[i]);
      print(listData[i][1]);
    }
  }

  void searchData(String sContact) async{
    var listData = await dbHelper.getSearchData(sContact);
    for(var i=0;i<listData.length;i++){
      print(listData[i]);
      print(listData[i][1]);
    }
  }

}