import 'dart:async';
import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.blue,
      home: new Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}


class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 3000), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return haImeg();
  }





  }


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'fuck',
      home: new Scaffold(
        appBar: AppBar(title: new Text('hello'),),
      body: new Stack(
        children: <Widget>[

          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image :new AssetImage ('images/ali.jpg'),
                fit: BoxFit.cover,
              ),

            ),

            child: new BackdropFilter(
              filter: new prefix0.ImageFilter.blur(sigmaX: 2.6, sigmaY: 2.6),
              child: new Container(
                decoration: new BoxDecoration(
                  color: Colors.black.withOpacity(0.0)

                ),
              ),

            ),
          ),
          new Column(
            children: <Widget>[

              Padding(padding: EdgeInsets.all(99.0),),

               new Center(
                 child: new RaisedButton(
                   disabledColor: Colors.white,
                   child: new Text('دخول الى البرنامج',
                     style: TextStyle(fontSize: 33.0),
                     textAlign: TextAlign.center ,),
                   textColor: Colors.white,
                 )
               ,
               ),

              Padding(padding: EdgeInsets.all(66.0),),

              new RaisedButton(
                disabledColor: Colors.white,
                child: new Text('حول البرنامج',
                  style: TextStyle(fontSize: 33.0),
                  textAlign: TextAlign.center ,),
                textColor: Colors.white,
              ),

            ],

          ),



        ],
      )
      ),


    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


  }





  @override
  State<StatefulWidget> createState() {


  }

}

class haImeg extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/ali.jpg');
    Image image = Image(image: assetImage);

    return Container(child: image);
  }}