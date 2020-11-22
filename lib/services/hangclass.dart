import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';

class PokeDex{

  int numMin; //gen min
  int numMax; //gen max
  int numDex; //dex number
  String name; //pokemon's name
  String type1; //pokemon's 1st type
  String type2; //pokemon's 2nd type
  String imageURL; //pokemon's image
  int gen;
  String genName;

  PokeDex({this.gen, this.genName});

  random(min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }



  Future <void> getData() async {

    if(gen == 1){
      numMin = 1;
      numMax = 151;
    }else if(gen == 2){
      numMin = 152;
      numMax = 251;
    }else if(gen == 3){
      numMin = 252;
      numMax = 386;
    }else if(gen == 4){
      numMin = 387;
      numMax = 494;
    }else if(gen == 5){
      numMin = 495;
      numMax = 649;
    }else if(gen == 6){
      numMin = 650;
      numMax = 721;
    }else if(gen == 7){
      numMin = 722;
      numMax = 809;
    }else if(gen ==8){
      numMin = 810;
      numMax = 893;
    }

    numDex = random(numMin,numMax);                 //get the pokedex number

    Response response = await get("https://pokeapi.co/api/v2/pokemon/$numDex");
    Map pokeData= jsonDecode(response.body);

    name = (pokeData["name"]);              //get the pokemon's name

    List<dynamic> types = pokeData["types"];
    if(types.length == 1){
      Map typeMap = types[0];
      Map typeMapMap = typeMap["type"];
      type1 = typeMapMap["name"];           //get the first type
    }else{
      Map typeMap = types[0];
      Map typeMapMap = typeMap["type"];
      type1 = typeMapMap["name"];           //get the first type
      Map typeMap2 = types[1];
      Map typeMapMap2 = typeMap2["type"];
      type2 = typeMapMap2["name"];           //get the second type
    }
    Map pokeIMG = pokeData["sprites"];
    if (numDex < 809){
      imageURL = pokeIMG["front_default"];
    }else if(numDex > 809){
      Map wrap1 = pokeIMG["versions"];
      Map wrap2 = wrap1["generation-viii"];
      Map wrap3 = wrap2["icons"];
      imageURL = wrap3["front_default"];
    }

  }

  Future <void> getPokemon() async{

    Response response = await get("https://pokeapi.co/api/v2/pokemon/$numDex");
    Map pokeData= jsonDecode(response.body);

    name = (pokeData["name"]);              //get the pokemon's name

    List<dynamic> types = pokeData["types"];
    if(types.length == 1){
      Map typeMap = types[0];
      Map typeMapMap = typeMap["type"];
      type1 = typeMapMap["name"];           //get the first type
    }else{
      Map typeMap = types[0];
      Map typeMapMap = typeMap["type"];
      type1 = typeMapMap["name"];           //get the first type
      Map typeMap2 = types[1];
      Map typeMapMap2 = typeMap2["type"];
      type2 = typeMapMap2["name"];           //get the second type
    }
    Map pokeIMG = pokeData["sprites"];
    if (numDex < 809){
      imageURL = pokeIMG["front_default"];
    }else if(numDex > 809){
      Map wrap1 = pokeIMG["versions"];
      Map wrap2 = wrap1["generation-viii"];
      Map wrap3 = wrap2["icons"];
      imageURL = wrap3["front_default"];
    }

  }




}