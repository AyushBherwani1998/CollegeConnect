import 'dart:async';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:collegeconnect_app/user_interface/userinfo_form.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Profile extends StatelessWidget{
  final String userId;
  Profile({this.userId});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Profile",style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyForm(userId: userId,)));
            },
          ),
        ],
      ),
      body: ProfilePage(userId:userId),
    );
  }
  
}

class ProfilePage extends StatefulWidget{
  final String userId;
  ProfilePage({this.userId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyProfilePage(userId:userId);
  }
}

class MyProfilePage extends State<ProfilePage>{

  String name = "NAME";
  String dob = "DOB";
  String department = "DEPARTMENT";
  String profession = "PROFESSION";
  String mobile = "MOBILE";
  String email = "EMAIL";
  final String userId;
  MyProfilePage({this.userId});
  DocumentReference documentReference;
  StreamSubscription<DocumentSnapshot> subscription;
  DateTime date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentReference = Firestore.instance.collection('users').document(userId);
    subscription = documentReference.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          if(snapshot.data['name'].toString()!=null){
            name = snapshot.data['name'].toString();
          }
          if(snapshot.data['date'].toString()!=null){
            date = snapshot.data['date'];
            dob = date.toString().substring(0,11);
          }
          if(snapshot.data['department'].toString() != null){
            department = snapshot.data['department'].toString();
          }
          if(snapshot.data['profession'].toString() != null){
            profession = snapshot['profession'].toString();
          }
          if(snapshot.data['mobile'].toString() != null){
            mobile = snapshot['mobile'].toString();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
         Container(
           height: 120.0,
           width: 120.0,
             child:Padding(padding: EdgeInsets.fromLTRB(140.0,0,140.0,0),

             child:ClipOval(

               child: Image.asset('images/ayush.jpg',height: 50.0,width: 90.0,fit: BoxFit.fill,),

             )
    )
            //child: Image.asset('images/ayush.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(name,style: TextStyle(fontSize: 24.0),),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
//          ListTile(
//            title: Text("Name",style: TextStyle(fontSize: 18.0),),
//            subtitle: Text("Ayush Bherwani",style: TextStyle(fontSize: 18.0),),
//          ),
//          Padding(
//            padding: EdgeInsets.all(4.0),
//          ),
          ListTile(
            title: Text("DOB",style: TextStyle(fontSize: 18.0),),
            subtitle: Text(dob,style: TextStyle(fontSize: 18.0),),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          ListTile(
            title: Text("Department",style: TextStyle(fontSize: 18.0),),
            subtitle: Text(department,style: TextStyle(fontSize: 18.0),),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          ListTile(
            title: Text("Profession",style: TextStyle(fontSize: 18.0),),
            subtitle: Text(profession,style: TextStyle(fontSize: 18.0),),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          ListTile(
            title: Text("Mobile",style: TextStyle(fontSize: 18.0),),
            subtitle: Text(mobile,style: TextStyle(fontSize: 18.0),),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          ListTile(
            title: Text("Email",style: TextStyle(fontSize: 18.0),),
            subtitle: Text("ayush.bherwani1998@gmail.com",style: TextStyle(fontSize: 18.0),),
          ),
        ],
      ),
    );
  }
}