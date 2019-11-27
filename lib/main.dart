import 'package:bolha_musical/pages/login.dart';
import 'package:bolha_musical/pages/mapa.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/mapa': (context) => Mapa(),
        },
      ),
    );
  }
}
