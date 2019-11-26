import 'package:bolha_musical/pages/login.dart';
import 'package:bolha_musical/pages/mapa.dart';
import 'package:bolha_musical/redux/reducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'model/app_state.dart';

void main() {
  final _initialState = AppState();
  final Store<AppState> _store = Store<AppState>(reducer,
      initialState: _initialState, middleware: [thunkMiddleware]);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Login(store: store),
          '/mapa': (context) => Mapa(store: store),
        },
      ),
    );
  }
}
