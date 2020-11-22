import 'package:flutter/material.dart';
import 'package:hangman/screens/home.dart';
import 'package:hangman/screens/loading2.dart';
import 'package:hangman/screens/menu.dart';
import 'package:hangman/screens/loading.dart';
import 'package:hangman/screens/game.dart';
import 'package:hangman/screens/end.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/menu': (context) => MenuSelect(),
    '/loading': (context) => Loading(),
    '/game': (context) => Game(),
    '/end': (context) => EndScreen(),
    '/loading2' : (context) => LoadingLast(),
  }
));
