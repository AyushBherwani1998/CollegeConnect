import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RLostItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.white,
      title: Text("Report Lost Item",style: TextStyle(color: Colors.black),),
      iconTheme: IconThemeData(
        color: Colors.black
      ),),
      body: RLostItemForm(),
    );
  }

}

class RLostItemForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyRLostItemForm();
  }
}

class MyRLostItemForm extends State<RLostItemForm>{

  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController itemController = new TextEditingController();
  TextEditingController placeController = new TextEditingController();
  TextEditingController descController = new TextEditingController();

  DateTime date = null;

  final formats = {
    InputType.date: DateFormat('yyyy-MM-dd'),
  };
  InputType inputType = InputType.date;

  void _submit({String name,String place,String desc,String lostItem,String mobile}){
    print(date);
    Firestore.instance.collection('lostitems').document().setData({"name":name,"place":place,"desc":desc,"lostItem":lostItem,"mobile":mobile,"date":date.toString().substring(0,11)});
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(),
            controller: mobileController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              border: OutlineInputBorder(),
              labelText: "Mobile",
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: itemController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              border: OutlineInputBorder(),
              labelText: "Lost Item",
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: placeController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              border: OutlineInputBorder(),
              labelText: "Place",
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: DateTimePickerFormField(
              inputType: inputType,
              format: formats[inputType],
              decoration: InputDecoration(
                  labelText: 'Date', hasFloatingPlaceholder: false),
              onChanged: (dt) => setState(() => date = dt),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            maxLines: 3,
            controller: descController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black87, width: 0.0),
              ),
              border: OutlineInputBorder(),
              labelText: "Item Description",
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
                    child:Text("Report",style: TextStyle(color:Colors.white),)
                ),
              )
          ),
        ],
      ),
    );
  }


  void submit() {
    if(nameController.text.toString()== "" || mobileController.text.toString()=="" || date == null
        || itemController.text.toString()== "" || placeController.text.toString()=="" || descController.text.toString()==""){
      Scaffold.of(context).showSnackBar( SnackBar(content: Text("Fill all the fields! Some Field are empty")));
    }else{
      _submit(
        name: nameController.text.toString(),
        mobile: mobileController.text.toString(),
        lostItem: itemController.text.toString(),
        desc: descController.text.toString(),
        place: placeController.text.toString()
      );
    }
  }
}