import 'package:flutter/material.dart';
import 'package:collegeconnect_app/firebase_services/firebase_auth.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:collegeconnect_app/login/login_page.dart';
import 'package:collegeconnect_app/user_interface/home_page.dart';

class FireBaseAuthClass extends StatefulWidget{

  FireBaseAuthClass({this.auth});

  final FireBaseAuth auth;

  @override
  State<StatefulWidget> createState() => FireBaseAuthPage();

}

enum AuthStatus{
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class FireBaseAuthPage extends State<FireBaseAuthClass>{

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user){
      setState(() {
        if(user != null){
          _userId = user?.uid;
        }
        authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onLoggedIn(){
    widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });

      setState(() {
        authStatus = AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onSignedOut(){
    widget.auth.getCurrentUser().then((user){
      setState(() {
        authStatus = AuthStatus.NOT_LOGGED_IN;
        _userId = "";
      });
    });
  }

  Widget _waitingScreen(){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: JumpingDotsProgressIndicator(
          fontSize: 50.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus){
      case AuthStatus.NOT_DETERMINED:
        return _waitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return LoginPage(
            auth: widget.auth,
            onSignedIn : _onLoggedIn
        );
        break;
      case AuthStatus.LOGGED_IN:
        if(_userId.length > 0 && _userId != null){
          return Home(userId: _userId,auth: widget.auth,onSignedOut: _onSignedOut,);
        }else return _waitingScreen();
        break;
      default:
        return _waitingScreen();
    }
  }
}