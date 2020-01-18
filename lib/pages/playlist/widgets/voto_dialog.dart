// Define a custom Form widget.
import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/model/Voto.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class VotoDialog extends StatefulWidget {
  bool _cimavoto;
  int _track_id_interno;

  VotoDialog(this._cimavoto, this._track_id_interno);

  @override
  VotoDialogState createState() {
    return VotoDialogState(_cimavoto, this._track_id_interno);
  }
}

class VotoDialogState extends State<VotoDialog> {
  int _track_id_interno;
  bool _cimavoto;
  bool _refletir_spotify = false;

  VotoDialogState(this._cimavoto, this._track_id_interno);

  @override
  void initState() {
    super.initState();
    // se já curtiu só upvota e vaza
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return AlertDialog(
            title: Center(child: Text(_cimavoto ? 'Cimavotar' : 'Baixavotar')),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    value: _refletir_spotify,
                    onChanged: (a) {},
                    title: Text('Salvar Música na Minha Biblioteca',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _cimavoto ? Colors.green : Colors.red)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Fechar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Criar'),
                onPressed: () {
                  TrackApi.votar(Voto((b) => b
                    ..refletirSpotify = _refletir_spotify
                    ..cimavoto = _cimavoto
                    ..trackInternoId = _track_id_interno));
                },
              )
            ],
          );
        });
  }
}
