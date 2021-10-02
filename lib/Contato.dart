class Contato{
  String nome;
  String numero;

  Contato({this.nome,this.numero});

  Contato.fromJson(Map<dynamic,dynamic> json){
    nome = json['nome'];
    numero = json['numero'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic,dynamic> json = Map<dynamic,dynamic>();
    json['nome'] = nome;
    json['numero'] = numero;
    return json;
  }
}