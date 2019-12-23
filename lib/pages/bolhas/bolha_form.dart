// Define a custom Form widget.
import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BolhasForm extends StatefulWidget {
  @override
  BolhasFormState createState() {
    return BolhasFormState();
  }
}

class BolhasFormState extends State<BolhasForm> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return AlertDialog(
      title: Text('Adicionar Bolha'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Apelido"),
            )
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text('Criar'),
          onPressed: () {
            BolhaApi.criarBolha(_textFieldController.value.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
