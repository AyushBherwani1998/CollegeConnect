import 'package:cloud_firestore/cloud_firestore.dart';
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
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.white,child: Icon(Icons.add,color:Color(0xFF5433FF),),onPressed: (){
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
      child: Lost(),
    );
  }
}

class Lost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('lostitems').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))
                  ),
                  height: 100.0,
                  child: Card(
                    color: Color(0xFF5433FF),
                    elevation: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
                      ),
                      child: Center(
                        child: new ListTile(
                          title: Container(
                            padding:EdgeInsets.all(4.0) ,
                            child: new Text(document['lostItem'],style: TextStyle(color: Colors.white),),
                          ),
                          subtitle: Container(
                            padding:EdgeInsets.all(4.0) ,
                            child: new Text(document['desc'],style: TextStyle(color: Colors.white70),),
                          ),
                        ),
                      ),
                    )
                  ) ,
                );
              }).toList(),
            );
        }
      },
    );
  }
}