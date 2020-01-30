import 'dart:async';

import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/UsersSessaoUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    if (_onDestroy != null) {
      _onDestroy.cancel();
    }
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    UsersSessaoUtils.inicializarSessaoComToken();
    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.startsWith(
          "http://10.0.0.108:3001/api/v1/spotify/login/callback?code")) {
        flutterWebviewPlugin.close();
        UsersSessaoUtils.inicializarSessaoComState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          if (state.authState.id != null && state.token.token == null) {
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
                            "https://accounts.spotify.com/authorize?client_id=c03736df76424cde8deda585b4bfbad8&response_type=code&redirect_uri=http://10.0.0.108:3001/api/v1/spotify/login/callback&scope=user-read-private playlist-read-private user-top-read user-follow-modify user-library-modify user-modify-playback-state user-read-playback-state user-read-currently-playing app-remote-control user-follow-read user-read-recently-played streaming user-library-read user-read-email&state=${state.authState.id}";
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
            _geAuthState();
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _geAuthState() async {
    if (store.state.authState.id == null) {
      AuthState authstate = await UsersApi.getAuthState();
      if (authstate != null) {
        store.dispatch(SetAuthState(authstate));
      }
    }
  }
}
