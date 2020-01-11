import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/pages/eu/eu.dart';
import 'package:bolha_musical/pages/mapa/mapa.dart';
import 'package:bolha_musical/pages/playlist/playlist.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'bolhas/bolhas.dart';
import 'chat/chat_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  Timer _timer;
  int _currentIndex = 3;

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
  }

  _location() async {
    Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    Localizacao _localizacao = new Localizacao((b) => b
      ..latitude = position.latitude
      ..longitude = position.longitude);
    store.dispatch(SetLocalizacaoAtual(_localizacao));
    UsersApi.enviarLocalizacaoAtual();
  }

  @override
  initState() {
    super.initState();
    _location();
    BolhaApi.getBolhaAtual();
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      // _location();
      BolhaApi.getBolhaAtual();
    });
  }

  @override
  Widget build(BuildContext context) {
    var paginas = [Mapa(), ChatScreen(), Bolhas(), Playlist(), Eu()];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
        ));
  }

  List<BottomNavigationBarItem> _bottomBarList() {
    return [
      BottomNavigationBarItem(
          title: Text(
            "Mapa",
            style: TextStyle(color: _ItemBottomColor(0)),
          ),
          icon: Icon(
            Icons.map,
            color: _ItemBottomColor(0),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Chat",
            style: TextStyle(color: _ItemBottomColor(1)),
          ),
          icon: Icon(
            Icons.chat,
            color: _ItemBottomColor(1),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Bolhas",
            style: TextStyle(color: _ItemBottomColor(2)),
          ),
          icon: Icon(
            Icons.bubble_chart,
            color: _ItemBottomColor(2),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Playlist",
            style: TextStyle(color: _ItemBottomColor(3)),
          ),
          icon: Icon(
            Icons.playlist_play,
            color: _ItemBottomColor(3),
          )),
      BottomNavigationBarItem(
          title: Text(
            "Eu",
            style: TextStyle(color: _ItemBottomColor(4)),
          ),
          icon: Icon(
            Icons.person_outline,
            color: _ItemBottomColor(4),
          ))
    ];
  }

  _ItemBottomColor(index) {
    return _currentIndex == index ? Colors.yellowAccent : Colors.white;
  }
}
