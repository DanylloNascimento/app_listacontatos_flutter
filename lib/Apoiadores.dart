import 'package:flutter/material.dart';

class ApaiadoresTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Apoiadores",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/imagens/logo_fafic.png',
                  width: 250,
                  height: 200,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/imagens/logo_ciencia_computacao.jpg',
                  width: 250,
                  height: 200,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/imagens/logo_oab.jpeg',
                  width: 250,
                  height: 200,
                ),
              ),
            ],
          ),
        ));
  }
}
