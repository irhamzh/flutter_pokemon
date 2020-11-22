import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Column(
                  children: <Widget>[
                   Text(
                    "HANGMAN",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      fontFamily: 'Merriweather',
//                      color: Colors.red,
                    ),
                  ),
                    Text(
                      "pokemon edition",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                        fontFamily: 'Merriweather',
                        color: Colors.yellow,
                      ),
                    ),
                  ]
                ),
              )
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 50),
                width: 150.0,
                height: 120.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.redAccent,
                    size: 100
                  ),
//                  label: Text('Play'),
//                  color: Colors.lightBlue
                )
              ),
            ),
          ]
        ),
      )
    );
  }
}
