import 'dart:async';
import 'dart:io';

import 'package:bolha_musical/api/me.dart';
import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/model/app_state.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

import 'mapa.dart';

class Login extends StatefulWidget {
  final Store<AppState> store;

  Login({this.store});

  @override
  _LoginState createState() => new _LoginState(store: store);
}

class _LoginState extends State<Login> {
  final Store<AppState> store;

  _LoginState({this.store});

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  Future<AuthState> authState;

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    flutterWebviewPlugin.close();
    _geAuthState(store);
    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print("URL changed: $url");
      if (url.startsWith("http://10.0.0.108:3001/api/spotify/login/callback")) {
        print("te fuder carai funciona");
        flutterWebviewPlugin.close();
        _getToken(store, store.state.authState);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Mapa(store: store)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          if (state.authState.id != null) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("./assets/login/l03.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SizedBox(
                    width: 300,
                    child: FlatButton(
                      onPressed: () async {

                        String url =
                            "https://accounts.spotify.com/authorize?client_id=c03736df76424cde8deda585b4bfbad8&response_type=code&redirect_uri=http://10.0.0.108:3001/api/spotify/login/callback&scope=user-read-private playlist-read-private user-top-read user-follow-modify user-library-modify user-modify-playback-state user-read-playback-state user-read-currently-playing app-remote-control user-follow-read user-read-recently-played streaming user-library-read user-read-email&state=${state.authState.id}";
                        print(url);
                        if (state.authState.id != null) {
                          flutterWebviewPlugin.launch(url);
                        }
                      },
                      color: Color.fromRGBO(30, 215, 96, 1),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/spotify-logo/Spotify_Icon_CMYK_White.png",
                            width: 22.0,
                            height: 22.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              state.authState.id != null
                                  ? "LOGIN COM SPOTIFY"
                                  : "Carregando...", //,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: "Roboto",
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    )),
              ) /* add child content here */,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


  void _getToken(Store store, AuthState authState) async {
    final res =
    await http.get("http://10.0.0.108:3001/api/spotify/state/trocar/token?state=${authState.id}");
    if (res.statusCode == 200) {
      print("get otkennnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
      print(res.body);
      Token tokenDto = Token.fromJson(res.body);
      store.dispatch(SetToken(tokenDto));
      getMe(store, tokenDto);
    } else {
      _geAuthState(store);
      print("falhou feio");
      print(res);
    }

  }

  void _geAuthState(Store store) async {
    final res =
        await http.get("http://10.0.0.108:3001/api/spotify/login/codigo/novo");
    if (res.statusCode == 200) {
      print(res.body);
      AuthState authstate = AuthState.fromJson(res.body);
      store.dispatch(SetAuthState(authstate));
    }
  }
}
