import 'dart:async';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/model/app_state.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

class Esqueleto extends StatefulWidget {
  final Store<AppState> store;

  Esqueleto({this.store});

  @override
  _EsqueletoState createState() => new _EsqueletoState(store: store);
}

class _EsqueletoState extends State<Esqueleto> {
  final Store<AppState> store;

  _EsqueletoState({this.store});

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
    super.dispose();
  }

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Center(child: Text("THIS IS REAL LIFE ?"));
        },
      ),
    );
  }

}
