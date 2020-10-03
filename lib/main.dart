import 'package:bolha_musical/pages/app.dart';
import 'package:bolha_musical/pages/bolhas/bolhas.dart';
import 'package:bolha_musical/pages/chat/chat_screen.dart';
import 'package:bolha_musical/pages/chat/pessoas.dart';
import 'package:bolha_musical/pages/login.dart';
import 'package:bolha_musical/pages/mapa/mapa.dart';
import 'package:bolha_musical/pages/playlist/playlist.dart';
import 'package:bolha_musical/pages/playlist/playlist_search.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_redux/flutter_redux.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() {
  setupLocator();
  runApp(MyApp());
  _notification();
}

_notification() {
  flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/launcher_icon');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
}

Future onSelectNotification(String payload) async {
  if (payload != null) {
    debugPrint('notification payload: ' + payload);
    if (payload == "chat-notification") {
      store.dispatch(SetNotificacaoMessages([]));
    }
  }
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
          '/track-search': (conAtext) => PlayListSearch(),
          '/pessoas': (context) => Pessoas(),
        },
      ),
    );
  }
}
