import 'package:flutter/material.dart';
import 'package:collegeconnect_app/user_interface/homepage.dart';

void main() => runApp(MyApp());

class MyApp  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppFood();
  }
}

class MyAppFood extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePage();
  }
}

