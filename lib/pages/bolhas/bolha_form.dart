// Define a custom Form widget.
import 'dart:collection';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/ReferenciaTamanhoBolha.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class BolhasForm extends StatefulWidget {
  @override
  BolhasFormState createState() {
    return BolhasFormState();
  }
}

class BolhasFormState extends State<BolhasForm> {
  TextEditingController _textFieldController = TextEditingController();
  Color _color = Colors.blue[800];
  String _idReferencia;
  bool _eh_fixa = false;
  Map<String, Object> _opcoesLocalizacao = new HashMap();
  Map<String, Object> _errors = new HashMap();
  @override
  initState() {
    super.initState();
    _opcoesLocalizacao["Parada"] = true;
    _opcoesLocalizacao["Se moverá comigo"] = false;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Color.fromRGBO(1, 41, 51, 1),
            title: Center(
              child: Text(
                'Adicionar Bolha',
                style: TextStyle(color: Colors.white),
              ),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.40,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Apelido da Bolha",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Theme(
                        data: ThemeData(hintColor: Colors.blueGrey),
                        child: TextField(
                          controller: _textFieldController,
                          style: TextStyle(color: Color(0xFFBDBDBD)),
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: "Ex: Galera do Rap ZL",
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFBDBDBD))),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tamanho da Bolha (metros)",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: _gerarReferenciaTamanhoDropdown(
                          state.referenciasTamanhoBolha),
                      onChanged: (String value) async {
                        setState(() {
                          _idReferencia = value;
                        });
                      },
                      value: _idReferencia,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Localização da Bolha",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RadioButtonGroup(
                      labels: _opcoesLocalizacao.entries
                          .map((item) => item.key)
                          .toList(),
                      activeColor: Colors.yellowAccent,
                      labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                      onSelected: (String selected) {
                        _eh_fixa = _opcoesLocalizacao[selected];
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cor da Bolha",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: MaterialColorPicker(
                        selectedColor: _color,
                        onColorChange: (color) {
                          setState(() => _color = color);
                        },
                        onBack: () => print("Back button pressed"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Criar'),
                onPressed: () async {
                  var bolha = Bolha((b) => b
                    ..ehFixa = _eh_fixa
                    ..apelido = _textFieldController.value.text
                    ..tamanho_bolha_referencia_id =
                        _idReferencia != null ? int.parse(_idReferencia) : null
                    ..cor = _color.value.toString());
                  print("criar bolha");
                  _errors.clear();
                  var result = await BolhaApi.criarBolha(bolha);
                  if (result is Bolha) {
                    Navigator.of(context).pop();
                  } else {
                    print(result);
                    // print(result.map((item) => item.keys.first));
                    result.forEach((item) {
                      _errors[item.keys.first] = item[item.keys.first].first;
                    });
                    print(_errors);
                  }
                },
              )
            ],
          );
        });
  }

  List<DropdownMenuItem<String>> _gerarReferenciaTamanhoDropdown(
      List<ReferenciaTamanhoBolha> referencias) {
    List<DropdownMenuItem<String>> lista = [];
    if (referencias.isNotEmpty) {
      for (var i = 0; i < referencias.length; i++) {
        lista.add(DropdownMenuItem<String>(
          key: UniqueKey(),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: referencias[i].raioMetros.toString(),
                      style: TextStyle(color: Colors.blueGrey)),
                ],
              ),
            ),
          ),
          value: referencias[i].id.toString(),
        ));
      }
    } else {
      print("Está vazio");
      print(store.state.referenciasTamanhoBolha);
      _idReferencia = null;
    }

    return lista;
  }
}
