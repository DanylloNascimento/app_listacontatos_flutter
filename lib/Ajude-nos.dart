import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:share/share.dart';

class TelaAjude extends StatefulWidget {
  @override
  _AjudeNosState createState() => _AjudeNosState();
}

class _AjudeNosState extends State<TelaAjude> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerMensagem = TextEditingController();
  var maskTelefone = MaskedTextController(mask: '(00) 0 0000 0000');
  String _mensagem;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajude-Nos",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Elogios/Sugestões",
              style: TextStyle(
                fontSize: 30,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: controllerNome,
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.purple),
                        errorStyle: TextStyle(fontSize: 20.0),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                      style: TextStyle(color: Colors.purple, fontSize: 20.0),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Preencha esse Campo!";
                        } else if (value.length <= 3) {
                          return "Use mais que TRÊS caracteres";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: maskTelefone,
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 20.0),
                        hintText: "(xx) 9 xxxx xxxx",
                        labelText: "Telefone",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.purple,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                      style: TextStyle(color: Colors.purple, fontSize: 20.0),
                      validator: (telefone) {
                        if (telefone.isEmpty) {
                          return "Use o Formato (xx) 9 xxxx xxxx";
                        } else if (telefone.length < 16) {
                          return "Use o Formato (xx) 9 xxxx xxxx";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70.0),
                    child: TextFormField(
                      controller: controllerMensagem,
                      maxLines: 5,
                      maxLength: 150,
                      decoration: InputDecoration(
                        labelText: "Mensagem",
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.purple),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        errorStyle: TextStyle(fontSize: 20.0),
                      ),
                      style: TextStyle(color: Colors.purple, fontSize: 20.0),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Preencha esse Campo!";
                        } else if (value.length <= 10) {
                          return "Use mais que DEZ caracteres!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _mensagem = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 245),
                    child: RaisedButton(
                      color: Colors.purple,
                      child: Text(
                        "Envie",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        if (_form.currentState.validate()) {
                          _form.currentState.save();
                          Share.share(_mensagem);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
