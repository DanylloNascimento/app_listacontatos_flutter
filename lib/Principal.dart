import 'dart:io';

import 'package:app_lista_telefonica/Ajude-nos.dart';
import 'package:app_lista_telefonica/Apoiadores.dart';
import 'package:app_lista_telefonica/Categoria.dart';
import 'package:app_lista_telefonica/CategoriaApi.dart';
import 'package:app_lista_telefonica/ListaTelefones.dart';
import 'package:app_lista_telefonica/TabbleView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.phone_in_talk,
                size: 25,
                color: Colors.white,
              ),
              Text(
                "  TelefonesCZ",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.purpleAccent[200],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        closeManually: false,
        backgroundColor: Colors.purple,
        shape: CircleBorder(),
        overlayColor: Colors.black45,
        children: [
          SpeedDialChild(
              label: 'Sobre Cajazeiras',
              labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
              child: IconButton(
                icon: Icon(Icons.info_outline),
                color: Colors.purple,
                iconSize: 25,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  TableView()),
                  );
                },
              ),
              backgroundColor: Colors.white,
              onTap: () {
                print("OK");
              }),
          SpeedDialChild(
              label: 'Ajude-nos',
              labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
                child: IconButton(
                icon: Icon(Icons.help_outline),
                color: Colors.purple,
                iconSize: 25,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  TelaAjude()),
                  );
                },
              ),
              backgroundColor: Colors.white),
          SpeedDialChild(
              label: 'Apoiadores',
              labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
               child: IconButton(
                icon: Icon(Icons.phonelink_setup),
                color: Colors.purple,
                iconSize: 25,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ApaiadoresTela()),
                  );
                },
              ),
              backgroundColor: Colors.white),
          SpeedDialChild(
              label: 'Sair',
              labelStyle: TextStyle(
                  fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
               child: IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.purple,
                iconSize: 25,
                onPressed: () => exit(0),
              ),
              backgroundColor: Colors.white),
        ],
      ),
      body: _body(),
    );
  }
}

_body() {
  return FutureBuilder(
      future: CategoriaApi.getContato(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Categoria> listaContatos = snapshot.data;
        return _listView(listaContatos);
      });
}

_listView(List<Categoria> listaContatos) {
  return ListView.builder(
      itemCount: listaContatos.length,
      itemBuilder: (context, index) {
        return itemList(context, listaContatos[index]);
      });
}

itemList(BuildContext context, Categoria listaContato) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListaTelefones(listaContato);
      }));
    },
    child: Column(
      children: <Widget>[
        ListTile(
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 35,
          ),
          title: Text(
            listaContato.categoria,
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
        Divider(),
      ],
    ),
  );
}
