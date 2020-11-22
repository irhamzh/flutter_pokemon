import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hangman/services/hangclass.dart';

class LoadingLast extends StatefulWidget {
  @override
  _LoadingLastState createState() => _LoadingLastState();
}

class _LoadingLastState extends State<LoadingLast> {

  Map pokeData = {};

  void getPokeDex(int num, String name, int numdex, String result) async {
    PokeDex pokedex = PokeDex(gen: num, genName: name);
    pokedex.numDex = numdex;
    await pokedex.getPokemon();
    Navigator.pushNamed(context, '/end', arguments: {
      'numDex': pokedex.numDex,
      'name': pokedex.name,
      'type1': pokedex.type1,
      'type2': pokedex.type2,
      'imageURL': pokedex.imageURL,
      'gen' : pokedex.gen,
      'genName' : pokedex.genName,
      'result': result,
    });
  }

  @override
  Widget build(BuildContext context) {

    pokeData = ModalRoute.of(context).settings.arguments;

    getPokeDex(pokeData["gen"], pokeData["genName"], pokeData["numDex"], pokeData["result"]);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
            children: <Widget> [
              Container(
                margin: EdgeInsets.fromLTRB(0, 250, 0, 40),
                child: SpinKitPulse(
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
