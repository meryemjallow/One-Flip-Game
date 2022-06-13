import 'package:flutter/material.dart';
import 'package:oneflip/pages/home.dart';
import 'package:oneflip/pages/level.dart';
import 'package:oneflip/pages/easy.dart';
import 'package:oneflip/pages/medium.dart';
import 'package:oneflip/pages/hard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oneflip',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (BuildContext ctx)=> Page1(),
        '/login': (BuildContext ctx) => login(),
        '/level' : (BuildContext ctx) => Page2(),
        '/easy' : (BuildContext ctx) => easy(),
        '/medium' : (BuildContext ctx) => medium(),
        '/hard' : (BuildContext ctx) => hard(),
      },
    );
  }
}