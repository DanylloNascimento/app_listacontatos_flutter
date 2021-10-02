import 'package:app_lista_telefonica/Contato.dart';

class Categoria{
  String categoria;
  List<Contato> telefones;

  Categoria({this.categoria,this.telefones});

  Categoria.fromJson(Map<dynamic,dynamic> json){
    categoria = json['categoria'];
    var list = json['telefones'] as List;

    List<Contato> telefonesLista = list.map((i) => Contato.fromJson(i)).toList();
    telefones = telefonesLista;
  }

  Map<dynamic,dynamic> toJson(){
    Map<dynamic,dynamic> json = Map<dynamic,dynamic>();
    json['categoria'] = this.categoria;
    json['telefones'] = this.telefones;
    return json;
  }
}