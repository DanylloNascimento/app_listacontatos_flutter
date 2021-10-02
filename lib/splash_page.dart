import 'dart:async';

import 'package:app_lista_telefonica/Principal.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashTela(),
  ));
}

class SplashTela extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<SplashTela> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Principal())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Image.asset('assets/imagens/logo-TelefonesCZ.PNG', width: 250, height: 250,),
          ),

          Center(
            child: CircularProgressIndicator(),
          ),
          
          Text("Bem vindo", style: TextStyle(fontSize: 30, color: Colors.purpleAccent, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
