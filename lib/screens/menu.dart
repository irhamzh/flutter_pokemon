import 'package:flutter/material.dart';
import 'package:hangman/services/hangclass.dart';



class MenuSelect extends StatefulWidget {
  @override
  _MenuSelectState createState() => _MenuSelectState();
}

class _MenuSelectState extends State<MenuSelect> {

  List<PokeDex> menus = [
    PokeDex(gen: 1, genName: "Red Blue Yellow"),
    PokeDex(gen: 2, genName: "Gold Silver Crystal"),
    PokeDex(gen: 3, genName: "Ruby Sapphire Emerald"),
    PokeDex(gen: 4, genName: "Diamond Pearl Platinum"),
    PokeDex(gen: 5, genName: "Black White B2W2"),
    PokeDex(gen: 6, genName: "X Y"),
    PokeDex(gen: 7, genName: "Sun Moon USUM"),
    PokeDex(gen: 8, genName: "Sword Shield")
  ];

  void getLoading(index) async{
    Navigator.pushNamed(context, "/loading", arguments: {
      'gen': menus[index].gen,
      'genName': menus[index].genName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Select the Generation"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  getLoading(index);
                },
                title: Text("${menus[index].genName}"),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                      'assets/${menus[index].gen}.png'),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
