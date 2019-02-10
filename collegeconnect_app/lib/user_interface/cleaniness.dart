import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Cleaniness extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        centerTitle: true,
        title: Text("Request a Clean up",style: TextStyle(color: Colors.black),),
      ),
      body: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePage();
  }
}

class MyHomePage extends State<HomePage>{
  TextEditingController roomNo = new TextEditingController();
  String block;
  List<DropdownMenuItem<String>> blockList = [];
  List<String> dropListBlock = ["A","B","D"];
  String building;
  List<DropdownMenuItem<String>> buildingList = [];
  List<String> dropListBul = ["PIET","PIT","MBBS"];

  void _submit({String roomNo,String building,String block}){
      Firestore.instance.collection("clean").document().setData({"roomNO":roomNo,"block":block,"building":building});
      Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    building = null;
    block =  null;
    buildingList = dropListBul.map((val)=> new DropdownMenuItem(child: new Text(val),value: val,)).toList();
    blockList = dropListBlock.map((val)=> new DropdownMenuItem(child: new Text(val),value: val,)).toList();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              "Building",
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
            ),
          ),
          Container(
            height: 55.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text("Select Building"),
                    items: buildingList,
                    value: building,
                    iconSize: 30.0,
                    elevation: 8,
                    onChanged: (value){
                      setState(() {
                        building = value;
                      });
                    })
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              "Block",
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
            ),
          ),
          Container(
            height: 55.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text("Select Block"),
                    items: blockList,
                    value: block,
                    iconSize: 30.0,
                    elevation: 8,
                    onChanged: (value){
                      setState(() {
                        block = value;
                      });
                    })
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: roomNo,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              border: OutlineInputBorder(),
              labelText: "Room No",
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(50, 0.0, 50, 0.0),
              child: MaterialButton(
                onPressed: submit,
                color: Colors.blue,
                child: Container(
                    padding:EdgeInsets.all(12.0),
                    child:Text("Request",style: TextStyle(color:Colors.white),)
                ),
              )
          ),
        ],
      ),
    );
  }

  void submit(){
    if(roomNo.text.toString() == "" || building == null || block == null){
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Fill all the fields! Some Field are empty")));
    }else{
      _submit(roomNo: roomNo.text.toString(),block: block,building: building);
    }
  }
}
