import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/pages/eu/eu.dart';
import 'package:bolha_musical/pages/mapa/mapa.dart';
import 'package:bolha_musical/pages/playlist/playlist.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/ChatSocket.dart';
import '../main.dart';
import 'bolhas/bolhas.dart';
import 'chat/chat_screen.dart';

class App extends StatefulWidget {
  static ChatSocket chatSocket = ChatSocket();

  @override
  _AppState createState() => new _AppState(chatSocket);
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        store.dispatch(SetCurrentAppState('inactive'));
        break;
      case AppLifecycleState.paused:
        store.dispatch(SetCurrentAppState('paused'));
        break;
      case AppLifecycleState.resumed:
        store.dispatch(SetCurrentAppState('resumed'));
        break;
      case AppLifecycleState.detached:
        store.dispatch(SetCurrentAppState('detached'));
        print("detached");
        await BolhaApi.sairBolha();
        break;
    }
  }
}

class _AppState extends State<App> {
  Timer _timer;
  int _currentIndex = 2;
  ChatSocket _chatSocket;

  _AppState(this._chatSocket);

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _chatSocket.dispose();
  }

  _location() async {
    Position position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);

    if (position != null) {
      Localizacao _localizacao = new Localizacao((b) => b
        ..latitude = position.latitude
        ..longitude = position.longitude);
      store.dispatch(SetLocalizacaoAtual(_localizacao));
    }

    UsersApi.enviarLocalizacaoAtual();
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(new LifecycleEventHandler());
    _location();
    _apiInicial();
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      _location();
      BolhaApi.getBolhaAtual();
    });
    _showOngoingNotification();
  }

  Future<void> _showOngoingNotification() async {
    final prefs = await SharedPreferences.getInstance();
    bool som = true;
    var prefAtivarSom = prefs.getString('_ativarSomNotificacao') ?? null;
    if (prefAtivarSom != null) {
      som = prefAtivarSom == "1";
    }
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '0', 'permanente', 'enquanto aberto',
        importance: Importance.Max,
        priority: Priority.High,
        ongoing: true,
        autoCancel: false,
        playSound: som);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(presentSound: som);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0,
        'Bolha musical executando',
        'Equanto aberto vamos reproduzir as músicas normalmente',
        platformChannelSpecifics);
  }

  _apiInicial() async {
    await BolhaApi.getBolhaAtual();
    BolhaApi.getReferenciaTamanhoBolha();
    if (store.state.bolhaAtual != null) {
      _chatSocket.startSocketChannel();
    }
  }

  @override
  Widget build(BuildContext context) {
    _chatSocket.setContext(context);
    _chatSocket.setCurrentIndex(_currentIndex);
    var paginas = [Mapa(), ChatScreen(), Bolhas(), Playlist(), Eu()];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new WillPopScope(
        onWillPop: () async => false,
        child: ConnectivityWidget(
          offlineBanner: Container(
            alignment: Alignment.topLeft,
            child: Flushbar(
              icon: Icon(
                Icons.signal_cellular_connected_no_internet_4_bar,
                color: Colors.white,
              ),
              flushbarPosition: FlushbarPosition.TOP,
              title: "Sem conexão",
              backgroundColor: Colors.red,
              message:
                  "Sua conexão está indisponivel, Verifique sua conexão de dados ou wifi",
              duration: Duration(seconds: 3),
            ),
          ),
          builder: (context, isOnline) => Scaffold(
            body: paginas[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromRGBO(1, 41, 51, 1),
              currentIndex: _currentIndex,
              items: _bottomBarList(),
              onTap: (index) {
                if (_currentIndex == index) {
                  return;
                }

                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }

  List<BottomNavigationBarItem> _bottomBarList() {
    return [
      BottomNavigationBarItem(
          title: Text(
            "Mapa",
            style: TextStyle(color: _itemBottomColor(0)),
          ),
          icon: Icon(
            Icons.map,
            color: _itemBottomColor(0),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Chat",
            style: TextStyle(color: _itemBottomColor(1)),
          ),
          icon: Icon(
            Icons.chat,
            color: _itemBottomColor(1),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Bolhas",
            style: TextStyle(color: _itemBottomColor(2)),
          ),
          icon: Icon(
            Icons.bubble_chart,
            color: _itemBottomColor(2),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Playlist",
            style: TextStyle(color: _itemBottomColor(3)),
          ),
          icon: Icon(
            Icons.queue_music,
            color: _itemBottomColor(3),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Eu",
            style: TextStyle(color: _itemBottomColor(4)),
          ),
          icon: Icon(
            Icons.person_outline,
            color: _itemBottomColor(4),
          ))
    ];
  }

  _itemBottomColor(index) {
    return _currentIndex == index ? Colors.yellowAccent : Colors.white;
  }
}
