// Define a custom Form widget.
import 'dart:collection';

import 'package:bolha_musical/api/ApiDialogs.dart';
import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/i18n/t.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/ReferenciaTamanhoBolha.dart';
import 'package:bolha_musical/model/ValidationError.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../app.dart';

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
  bool _apenasLiderAdicionaTrack = false;
  bool _eh_fixa = false;
  Map<String, Object> _opcoesLocalizacao = new HashMap();
  Map<String, Object> _opcoesLiderTrack = new HashMap();
  ValidationError _errors = ValidationError();

  @override
  initState() {
    super.initState();
    _opcoesLocalizacao[t.translate().bubble_option_fixed] = true;
    _opcoesLocalizacao[t.translate().bubble_my_current_location] = false;
    _opcoesLiderTrack[t.translate().everyone_can_add_music] = false;
    _opcoesLiderTrack[t.translate().only_me_can_add_music] = true;
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
                t.translate().add_bolha,
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
                        t.translate().bubble_nickname,
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
                            hintText: t.translate().tip_bubble_nickname,
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFBDBDBD))),
                          ),
                        )),
                    errorText('apelido'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        t.translate().who_can_add_music,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RadioButtonGroup(
                      labels: _opcoesLiderTrack.entries
                          .map((item) => item.key)
                          .toList(),
                      activeColor: Colors.yellowAccent,
                      labelStyle: TextStyle(color: Color(0xFFBDBDBD)),
                      onSelected: (String selected) {
                        _apenasLiderAdicionaTrack = _opcoesLiderTrack[selected];
                      },
                    ),
                    errorText('apenas_lider_adiciona_track'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        t.translate().bubble_size,
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
                    errorText('tamanho_bolha_referencia_id'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        t.translate().bubble_location,
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
                    errorText('eh_fixa'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        t.translate().bubble_color,
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
                  final navigator = Navigator.of(context);
                  var bolha = Bolha((b) => b
                    ..ehFixa = _eh_fixa
                    ..apelido = _textFieldController.value.text
                    ..tamanho_bolha_referencia_id =
                        _idReferencia != null ? int.parse(_idReferencia) : null
                    ..cor = _color.value.toString()
                    ..apenasLiderAdicionaTrack = _apenasLiderAdicionaTrack);
                  _errors.clearAll();
                  var result = await BolhaApi.criarBolha(bolha);
                  if (result is ValidationError) {
                    _errors = result;
                  } else if (result is Bolha) {
                    navigator.pop();
                    store.dispatch(SetBolhaAtual(null));
                    store.dispatch(SetPlaylist([]));
                    store.dispatch(SetMessages([]));
                    store.dispatch(SetBolhaAtual(result));
                    App.chatSocket.startSocketChannel();
                    ApiDialogs.sucessoDialog(
                        t.translate().bubble_successfully_created);
                  }
                },
              )
            ],
          );
        });
  }

  errorText(field) {
    if (_errors.has(field)) {
      return Text(
        _errors.get(field),
        style: TextStyle(color: Colors.red),
      );
    } else {
      return Container(width: 0.0, height: 0.0);
    }
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
      _idReferencia = null;
    }

    return lista;
  }
}
