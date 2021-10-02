import 'dart:convert';

import 'package:app_lista_telefonica/Categoria.dart';
import 'package:flutter/services.dart';

class CategoriaApi{
  static Future<List<Categoria>> getContato() async{
    String dados = await rootBundle.loadString("assets/telefonesCZ.json");
    List lista = json.decode(dados);
    List<Categoria> listaContatos = List<Categoria>();
    for(Map map in lista){
      Categoria contato = Categoria.fromJson(map);
      listaContatos.add(contato);
    }
    return listaContatos;
  }

}