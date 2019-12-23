import 'dart:async';
import 'package:bolha_musical/pages/mapa/mapa.dart';
import 'package:bolha_musical/pages/playlist/playlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bolhas/bolhas.dart';
import 'chat/chat_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  Timer _timer;
  int contador = 0;
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

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var paginas = [
      Mapa(),
      ChatScreen(),
      Bolhas(),
      Playlist(),
    ];
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
    ];
  }


  _ItemBottomColor(index) {
    return _currentIndex == index ? Colors.yellowAccent : Colors.white;
  }
}
