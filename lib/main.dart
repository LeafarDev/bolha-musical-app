import 'package:bolha_musical/pages/login.dart';
import 'package:bolha_musical/pages/mapa.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/mapa': (context) => Mapa(),
        },
      ),
    );
  }
}
