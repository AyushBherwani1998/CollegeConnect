import 'package:flutter/material.dart';
import 'package:collegeconnect_app/user_interface/report_lost_item.dart';
class LostItems extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lost Items",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFF5433FF),child: Icon(Icons.add),onPressed: (){
        print("FLOATING ACTION BUTTON PRESSED");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RLostItem()));
      }),
      body: LostItemHome(),
    );
  }

}

class LostItemHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LostItemHomePage();
  }
}

class LostItemHomePage extends State<LostItemHome>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container()
    );
  }
}