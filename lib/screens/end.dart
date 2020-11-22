import 'package:flutter/material.dart';


class EndScreen extends StatefulWidget {
  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  Map pokeData = {};

  String pokeType1;
  String pokeType2;




  @override
  Widget build(BuildContext context) {
    pokeData = ModalRoute.of(context).settings.arguments;

    pokeType1 = "${pokeData["type1"]}.jpg";
    pokeType2 = (pokeData["type2"] == null) ? "null.jpg" : "${pokeData["type2"]}.jpg";

    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: Column(
                        children: <Widget> [
                          Text(
                              "${pokeData["result"]}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: Text(
                                "The Pokemon is ${pokeData["name"]}",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                            width: 130,
                            height: 130,
                            child: Image.network(
                             "${pokeData["imageURL"]}"
                            )
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    width: 80,
                                    height: 60,
                                    child: Image(
                                      image: AssetImage("assets/$pokeType1"),
                                    )
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    width: 80,
                                    height: 60,
                                    child: Image(
                                      image: AssetImage("assets/$pokeType2"),
                                    )
                                )
                              ]
                          ),
                          Text(
                              "Play Again?",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              )
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                              width: 100.0,
                              height: 70.0,
                              child: RaisedButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, "/");
                                  },
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.black,
                                    size: 60,
                                  )
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}
