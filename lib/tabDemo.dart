import 'package:asia_pacific_app/call.dart';
import 'package:asia_pacific_app/chat.dart';
import 'package:asia_pacific_app/status.dart';
import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget{

  TabApp createState() => TabApp();

}

class TabApp extends State<TabDemo> with SingleTickerProviderStateMixin{

  late TabController tabController;
  var tabArray = [ChatDemo(),StatusDemo(),CallDemo()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabArray.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("Tab Demo"),
        backgroundColor: Colors.blue,
        bottom: getTab(),
      ),
        body: getTabView(),
      ),
    );
  }

  getTab(){
    return TabBar(
      tabs: [
        Tab(text: "Chat",),
        Tab(text: "Status",),
        Tab(text: "Call",),
      ],
      unselectedLabelColor: Colors.white,
      labelColor: Colors.black,
      controller: tabController,
      indicatorColor: Colors.red,
    );
  }

  getTabView(){
    return TabBarView(
      children: tabArray,
      controller: tabController,
    );
  }

}