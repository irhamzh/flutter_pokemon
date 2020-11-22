import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'dart:convert';
//import 'dart:math';
//import 'package:hangman/services/hangclass.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  Map pokeData = {};
  String pokeName;
  String pokeType1;
  String pokeType2;
  int lives = 5;
  String tries = "Remaining Guess: ";
  String temp;
  String word; // yg bakal ditampilin
  List<String> once = ["+"];

  void checkDone(){
    if (lives == 0){
      Navigator.pushNamed(context, '/loading2', arguments: {
        'numDex': pokeData["numDex"],
        'result' : "YOU LOSE",
        'gen' : pokeData["gen"],
        'genName': pokeData["genName"],
      });
    }
    else if(word.contains("_") == false){
      Navigator.pushNamed(context, '/loading2', arguments: {
        'numDex': pokeData["numDex"],
        'result' : "YOU WIN",
        'gen' : pokeData["gen"],
        'genName': pokeData["genName"],
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    pokeData = ModalRoute.of(context).settings.arguments;

    pokeName = (pokeName == null) ? pokeData["name"].toUpperCase() : pokeName;
    pokeType1 = "${pokeData["type1"]}.jpg";
    pokeType2 = (pokeData["type2"] == null) ? "null.jpg" : "${pokeData["type2"]}.jpg";

    word = (word == null) ? makeRow(pokeName) : word;


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                tries + "$lives",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontFamily:"Merriweather",
                )
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "$word",
                        style: TextStyle(
                          fontSize: 35,
//                          fontFamily: "Merriweather",
                        )
                      )
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Row(
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
                      )
                    )
                  ]
                )
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: <Widget> [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          setState((){
                            temp = checkAnsRow("A", word, pokeName, once);
                            if (word == temp){
                              lives--;
                            }else{
                              word = temp;
                            }
                            checkDone();
                          });
                        },
                        child: Text(
                          "A",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      FlatButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          setState((){
                            temp = checkAnsRow("B", word, pokeName, once);
                            if (word == temp){
                              lives--;
                            }else{
                              word = temp;
                            }
                            checkDone();
                          });
                        },
                        child: Text(
                          "B",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      FlatButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          setState((){
                            temp = checkAnsRow("C", word, pokeName, once);
                            if (word == temp){
                              lives--;
                            }else{
                              word = temp;
                            }
                            checkDone();
                          });
                        },
                        child: Text(
                          "C",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      FlatButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          setState((){
                            temp = checkAnsRow("D", word, pokeName, once);
                            if (word == temp){
                              lives--;
                            }else{
                              word = temp;
                            }
                            checkDone();
                          });
                        },
                        child: Text(
                          "D",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("E", word, pokeName, once);

                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "E",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("F", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "F",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("G", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "G",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("H", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "H",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("I", word, pokeName, once);

                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "I",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("J", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "J",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("K", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "K",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("L", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "L",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("M", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "M",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("N", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "N",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("O", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "O",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("P", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "P",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("Q", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "Q",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("R", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "R",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("S", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "S",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("T", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "T",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("U", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "U",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("V", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "V",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("W", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "W",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("X", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "X",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("Y", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "Y",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
//                        padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            setState((){
                              temp = checkAnsRow("Z", word, pokeName, once);
                              if (word == temp){
                                lives--;
                              }else{
                                word = temp;
                              }
                              checkDone();
                            });
                          },
                          child: Text(
                            "Z",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ]
                  ),
                  
                ]
              )
            )
          ]
        ),
      )
    );
  }
}

String makeRow(String name){
  String temp = "";
  for (int i = 0; i < name.length; i ++){
    temp += "_ ";
  }
  return temp;
}

String checkAnsRow(String letter, String word, String pokeName, List<String> once){ //buat check trus ngurangin nyawa, taro ni class ke string temp duls
  String temp = word;
  if(pokeName.contains(letter) == true && once.contains(letter) == false){
    once.add(letter);
    for (int i=0; i < pokeName.length; i++){
      if (letter == pokeName[i]){
        temp = replaceCharAt(temp, 2*i, letter);
      }
    }
  }else{
    return word;
  }
  return temp;
}

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}
