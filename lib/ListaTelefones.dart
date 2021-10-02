import 'package:app_lista_telefonica/Categoria.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class ListaTelefones extends StatelessWidget {
  Categoria categoria;
  ListaTelefones(this.categoria);

  _body() {
    return ListView.builder(
        itemCount: categoria.telefones.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    title: Text(
                      categoria.telefones[index].nome,
                      style: TextStyle(fontSize: 30),
                    ),
                    subtitle: Text(
                      categoria.telefones[index].numero,
                      style: TextStyle(fontSize: 30),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.phone,
                            size: 30,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            _launchCaller(categoria.telefones[index].numero);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            size: 30,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Share.share(categoria.telefones[index].numero);
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          );
        });
  }

  _launchCaller(String numero) async {
    String url = "tel:$numero";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoria.categoria,
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: _body(),
    );
  }
}
