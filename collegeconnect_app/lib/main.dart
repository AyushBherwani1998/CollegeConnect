import 'package:flutter/material.dart';
import './login/firebase_auth_login.dart';
import 'package:collegeconnect_app/firebase_services/firebase_auth.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Issue Ticketing System",
  home: FireBaseAuthClass(auth: new Auth(),),
));