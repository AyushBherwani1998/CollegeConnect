import 'package:collegeconnect_app/firebase_services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Home extends StatelessWidget{
  final String userId;
  final VoidCallback onSignedOut;
  final FireBaseAuth auth;
  Home({this.userId,this.auth,this.onSignedOut});
  _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF5433FF),
          centerTitle: true,
          title: Text("Home",style: TextStyle(color: Colors.white),),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Text("College Connect"),
                ),
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  _signOut();
                },
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                child: _wave(),
              ),
              SizedBox(height: 8.0,),
              Container(
                color: Colors.white,
                height: 603.0 - 260.0,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8.0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5433FF),
                                  borderRadius: BorderRadius.all(Radius.circular(16.0))
                                ),
                                height: 150.0,
                                child: GestureDetector(
                                  child: Card(
                                    color: Color(0xFF5433FF),
                                    elevation: 8.0,
                                    child: Center(
                                      child: Text("Lost & Found",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                )
                              )
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5433FF),
                                    borderRadius: BorderRadius.all(Radius.circular(16.0))
                                  ),
                                  height: 150.0,
                                  width: MediaQuery.of(context).size.width/2,
                                  child: GestureDetector(
                                    child: Card(
                                      color: Color(0xFF5433FF),
                                      elevation: 8.0,
                                      child: Center(
                                        child: Text("FOOD",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  )
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5433FF),
                                      borderRadius: BorderRadius.all(Radius.circular(16.0))
                                  ),
                                  height: 150.0,
                                  child: GestureDetector(
                                    child: Card(
                                      color: Color(0xFF5433FF),
                                      elevation: 8.0,
                                      child: Center(
                                        child: Text("CLEANINES",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  )
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                            ),
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF5433FF),
                                      borderRadius: BorderRadius.all(Radius.circular(16.0))
                                  ),
                                  height: 150.0,
                                  width: MediaQuery.of(context).size.width/2,
                                  child: GestureDetector(
                                    child: Card(
                                      color: Color(0xFF5433FF),
                                      elevation: 8.0,
                                      child: Center(
                                        child: Text("APPOINTMENTS",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  )
                                )
                            )
                          ],
                        )
                      ],
                    ) 
                  ]
                ),
              )
            ],
          ),
        )
      ),
    );
  }
  Widget _wave() {
    return WaveWidget(
      config: CustomConfig(
        colors: [
          Colors.white70,
          Colors.white54,
          Colors.white30,
          Colors.white,
        ],
        durations: [35000, 19440, 10800, 6000],
        heightPercentages: [0.20, 0.23, 0.25, 0.30],
        blur: null,
      ),
      backgroundColor: Color(0xFF5433FF),
      size: Size(
        double.infinity,
        double.infinity,
      ),
    );
  }

}