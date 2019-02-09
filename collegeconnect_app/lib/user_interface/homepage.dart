import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      backgroundColor: Colors.white,
        title: Text("Home"),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.white,
      body: HomePageBody(),
    );
  }

}

class HomePageBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyBody();
  }
}

class MyBody extends State<HomePageBody>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400.0,
            child: _wave(),
          ),
        ],
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
}
