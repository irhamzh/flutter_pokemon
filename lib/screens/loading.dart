import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hangman/services/hangclass.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map pokeData = {};

  void getPokeDex(int num, String name) async {
    PokeDex pokedex = PokeDex(gen: num, genName: name);
    await pokedex.getData();
    Navigator.pushNamed(context, '/game', arguments: {
      'numDex': pokedex.numDex,
      'name': pokedex.name,
      'type1': pokedex.type1,
      'type2': pokedex.type2,
      'imageURL': pokedex.imageURL,
      'gen' : pokedex.gen,
      'genName' : pokedex.genName,
    });
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pokeData = ModalRoute.of(context).settings.arguments;

    getPokeDex(pokeData["gen"], pokeData["genName"]);
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          children: <Widget> [
            Container(
              margin: EdgeInsets.fromLTRB(0, 250, 0, 40),
              child: SpinKitDoubleBounce(
                color: Colors.white,
                size: 130.0,
              ),
            ),
          ]
          ),
        ),
      );
    }
}



