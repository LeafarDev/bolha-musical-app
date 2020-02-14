import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/ValidationError.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/UsersSessaoUtils.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Eu extends StatefulWidget {
  @override
  EuState createState() {
    return EuState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class EuState extends State<Eu> {
  bool _mostrar_localizacao_mapa = true;
  String _language_code;
  ValidationError _errors = ValidationError();

  @override
  initState() {
    super.initState();
    _mostrar_localizacao_mapa = store.state.me.mostrar_localizacao_mapa;
    _language_code = store.state.me.language_code;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Center(
              child: Text(
                store.state.me.displayName != null
                    ? store.state.me.displayName
                    : "Carregando...",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            elevation: 0.0,
          ),
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: SafeArea(
            child: StoreConnector<AppState, AppState>(
                distinct: true,
                converter: (store) => store.state,
                builder: (context, state) {
                  if (state.me.id != null) {
                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      state.me.getImage()),
                                  radius: 100,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(color: Colors.white),
                                        children: [
                                          WidgetSpan(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2.0),
                                              child: Icon(
                                                Icons.people,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${state.me.followers.total} Seguidores"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.white),
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextSpan(text: "${state.me.country}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                child: SwitchListTile(
                                  value: _mostrar_localizacao_mapa,
                                  onChanged: (value) {
                                    if (value != _mostrar_localizacao_mapa) {
                                      setState(() {
                                        _mostrar_localizacao_mapa = value;
                                        _updaTeUserConfigs(context);
                                      });
                                    }
                                  },
                                  title: Text('Mostrar minha foto na bolha',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                              errorText('mostrar_localizacao_mapa'),
                              DropdownButton<String>(
                                isExpanded: true,
                                items: _gerarItemDropdownLanguage(
                                    [":pt-br", ":en"]),
                                onChanged: (String value) async {
                                  setState(() {
                                    _language_code = value;
                                  });
                                  _updaTeUserConfigs(context);
                                },
                                value: _language_code,
                              ),
                              errorText('language'),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.pink,
                          child: Center(
                            child: FlatButton.icon(
                                onPressed: () {
                                  if (store.state.bolhaAtual != null) {
                                    BolhaApi.sairBolha();
                                  }
                                  UsersSessaoUtils.logout();
                                },
                                icon: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Sair",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                        PlayerBar()
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )),
    );
  }

  List<DropdownMenuItem<String>> _gerarItemDropdownLanguage(
      List<String> keywords) {
    List<DropdownMenuItem<String>> lista = [];
    if (keywords.isNotEmpty) {
      for (var i = 0; i < keywords.length; i++) {
        lista.add(DropdownMenuItem<String>(
          key: UniqueKey(),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: _linguagemTexto(keywords[i]),
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ),
          value: keywords[i],
        ));
      }
    }

    return lista;
  }

  _updaTeUserConfigs(_context) async {
    var result = await UsersApi.updatePreferences(_language_code,
        _mostrar_localizacao_mapa, store.state.me.tocar_track_automaticamente);
    if (result == true) {
      final prefs = await SharedPreferences.getInstance();
      Me me = await UsersApi.getMe();
      if (me != null) {
        // mover para o getMe?
        prefs.setString('me', me.toJson());
        store.dispatch(SetME(me));
      }
      Flushbar(
        icon: Icon(
          Icons.done,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
        flushbarPosition: FlushbarPosition.TOP,
        message: "Preferencias atualizadas com sucesso",
        duration: Duration(seconds: 3),
      )..show(_context);
    } else if (result is ValidationError) {
      _errors = result;
    }
  }

  _linguagemTexto(keyword) {
    if (keyword == ":pt-br") {
      return "Português";
    }
    return "English";
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
}
