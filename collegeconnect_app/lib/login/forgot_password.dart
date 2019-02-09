import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:collegeconnect_app/firebase_services/firebase_auth.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xFF5433FF),
      ),
      body: ForgotPasswordPage(),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyForgotPasswordPage();
}

class MyForgotPasswordPage extends State<ForgotPasswordPage> {

  final forgotEmailController = TextEditingController();
  bool sent = false;

  @override
  void dispose() {
    super.dispose();
    forgotEmailController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _wave(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(24.0),
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 42.0, color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 300.0),
              child: beforeAndAfter(),
            )
          ],
        ));
  }

  Widget _wave() {
    return WaveWidget(
      config: CustomConfig(
        colors: [
          Colors.white70,
          Colors.white54,
          Colors.white30,
          Colors.white24,
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

  void _forgotPassword(){
    if(forgotEmailController.text.toString().length > 1){
      Auth auth = new Auth();
      auth.forgotPassword(forgotEmailController.text.toString()).catchError((e){
        print("Error: $e");
        print("Error");
        Scaffold.of(context).showSnackBar(const SnackBar(content: const Text("No account registered to this account, verify your email address")));
        setState((){
          sent = false;
        });
      });
      setState((){
        sent = true;
      });
    }
  }

  Widget beforeAndAfter(){
    if(!sent){
      return Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 8.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                            left: 25.0,
                            right: 25.0),
                        child: Text(
                          "Don't worry. Resetting your password is easy, just tell us the email address you registered with.",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                            left: 25.0,
                            right: 25.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: forgotEmailController,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold",
                                fontSize: 17.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.white70,
                      offset: Offset(3.0, 3.0),
                      blurRadius: 70.0,
                    ),
                  ],
                  color: Color(0xFF2962FF),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () {
                      print("Button Pressed");
                      _forgotPassword();
                    }),
              ),
            ],
          ),
        ],
      );
    }
    else{
      return Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 8.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                            left: 25.0,
                            right: 25.0),
                        child: Text(
                          "We have sent a rest password email to ${forgotEmailController.text.toString()} . Please click the reset password link to reset your password.\nDidn't recieve the email yet?\nPlease check your spam folder or resend the email.",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14.0
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.white70,
                      offset: Offset(3.0, 3.0),
                      blurRadius: 70.0,
                    ),
                  ],
                  color: Color(0xFF2962FF),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () {
                      print("Button Pressed");
                      _forgotPassword();
                    }),
              ),
            ],
          ),
        ],
      );
    }
  }
}