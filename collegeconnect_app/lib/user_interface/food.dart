import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:platform/platform.dart';
class Food extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Order Food",style: TextStyle(color: Colors.black),),
      ),
      body: FoodHome(),
    );
  }

}

class FoodHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FoodHomePage();
  }
}

class FoodHomePage extends State<FoodHome>{

  void openCanteen(String id){
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('https://zoma.to/r/$id'),
        package: 'com.application.zomato');
    intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(8.0,4.0,8.0,0.0),
            child: GestureDetector(
              onTap: (){
                  openCanteen("18721086");
              },
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset('images/burger.jpg',height: 90.0,width: 90.0,fit: BoxFit.fill,),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("OM SAI CANTEEN",overflow: TextOverflow.ellipsis,),
                        subtitle: Text("RATINGS 4/5"),
                        trailing: Image.asset('images/veg.png',height: 20.0,width: 20.0,),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(8.0,4.0,8.0,0.0),
              child: GestureDetector(
                onTap: (){
                  openCanteen("18925920");
                },
                child: Card(
                  elevation: 5.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Image.asset('images/chhole.jpg',height: 90.0,width: 90.0,fit: BoxFit.fill,),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("BANK CANTEEN"),
                          subtitle: Text("RATINGS 4.5/5"),
                          trailing: Image.asset('images/veg.png',height: 20.0,width: 20.0,),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0,4.0,8.0,0.0),
              child: GestureDetector(
                onTap: (){
                  openCanteen("3201229");
                },
                child: Card(
                  elevation: 5.0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child:
                        Image.asset('images/hotdog.jpg',height: 90.0,width: 90.0,fit: BoxFit.fill,),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text("HONEST CANTEEN",overflow: TextOverflow.ellipsis),
                          subtitle: Text("RATINGS 4.3/5"),
                          trailing: Image.asset('images/non.png',height: 20.0,width: 20.0,),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Container(

            padding: EdgeInsets.fromLTRB(8.0,4.0,8.0,0.0),
            child: GestureDetector(
              onTap: (){
                openCanteen("3200665");
              },
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child:
                      Image.asset('images/frankie.jpeg',height: 90.0,width: 90.0,fit: BoxFit.fill,),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("PHEONIX SERVICES",overflow: TextOverflow.ellipsis),
                        subtitle: Text("RATINGS 4.8/5"),
                        trailing: Image.asset('images/veg.png',height: 20.0,width: 20.0,),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
          Container(

            padding: EdgeInsets.fromLTRB(8.0,4.0,8.0,0.0),
            child: GestureDetector(
              onTap: (){
                openCanteen("18752849");
              },
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child:
                      Image.asset('images/meal.jpeg',height: 90.0,width: 90.0,fit: BoxFit.fill,),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("SHREE RANG CANTEEN",overflow: TextOverflow.ellipsis),
                        subtitle: Text("RATINGS 4.1/5"),
                        trailing: Image.asset('images/veg.png',height: 20.0,width: 20.0,),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}