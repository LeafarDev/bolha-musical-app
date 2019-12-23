import 'package:bolha_musical/pages/app.dart';
import 'package:bolha_musical/pages/bolhas/bolhas.dart';
import 'package:bolha_musical/pages/chat/chat_screen.dart';
import 'package:bolha_musical/pages/login.dart';
import 'package:bolha_musical/pages/mapa/mapa.dart';
import 'package:bolha_musical/pages/playlist/playlist.dart';
import 'package:bolha_musical/pages/playlist/playlist_search.dart';
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
          '/app': (context) => App(),
          '/mapa': (context) => Mapa(),
          '/playlist': (context) => Playlist(),
          '/bolhas': (context) => Bolhas(),
          '/chat': (context) => ChatScreen(),
          '/track-search': (context) => PlayListSearch()
        },
      ),
    );
  }
}
