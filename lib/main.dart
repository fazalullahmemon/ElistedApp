import 'package:flutter/material.dart';
import 'Jobs.dart';
import 'JobsCategory.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      /*home: Scaffold(
        //appBar: AppBar(title: Text('Title')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: DockerButton(),
        bottomNavigationBar: BottomNavBar(),
      ),*/
      home: Jobs(),
    );
  }
}
