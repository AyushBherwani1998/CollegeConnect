import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyForm extends StatelessWidget{
  final String userId;
  MyForm({this.userId});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("About Me",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: MyFormPage(userId: userId)
    );

  }
}

class MyFormPage extends StatefulWidget{
  final String userId;
  MyFormPage({this.userId});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyPage(userId: userId);
  }
}

class MyPage extends State<MyFormPage>{

  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  String department;
  List<DropdownMenuItem<String>> departmentList = [];
  List<String> dropListDep = ["MECH","CSE","IT"];
  String profession;
  List<DropdownMenuItem<String>> professionList = [];
  List<String> dropListPro = ["Student","Teacher"];
  DateTime date;
  final String userId;
  final formats = {
    InputType.date: DateFormat('yyyy-MM-dd'),
  };

  MyPage({this.userId});
  InputType inputType = InputType.date;

  void _submit({String name,int mobile}){
       Firestore.instance.collection('users').document(userId).setData({"name":name,"mobile":mobile,"date":date,"department":department,"profession":profession,"userInfo":true});
       Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    department = null;
    profession = null;
    departmentList = dropListDep.map((val)=> new DropdownMenuItem(child: new Text(val),value: val,)).toList();

    professionList = dropListPro.map((val)=> new DropdownMenuItem(child: new Text(val),value: val,)).toList();
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
              labelText: "Mobile ",
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
                  labelText: 'Date Of Birth', hasFloatingPlaceholder: false),
              onChanged: (dt) => setState(() => date = dt),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              "Department",
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
                    hint: Text("Select Department"),
                    items: departmentList,
                    value: department,
                    iconSize: 30.0,
                    elevation: 8,
                    onChanged: (value){
                      setState(() {
                        department = value;
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
              "Profession",
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
                    hint: Text("Select Profession"),
                    items: professionList,
                    value: profession,
                    iconSize: 30.0,
                    elevation: 8,
                    onChanged: (value){
                      setState(() {
                        profession = value;
                      });
                    })
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
            child:Text("Save",style: TextStyle(color:Colors.white),)
            ),
            )
          ),
        ],
      ),
    );
  }

  void submit() {
    if(nameController.text.toString() == "" || mobileController.text.toString() == "" || date == null || department == null || profession == null){
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Fill all the fields! Some Field are empty")));
    }else{
        _submit(name: nameController.text.toString(),
        mobile: int.tryParse(mobileController.text)
        );
    }
  }
}