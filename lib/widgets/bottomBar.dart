import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomBarList() {
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

callRoute({route, replacement = true}) {
  if (replacement == true) {
    Navigator.pushReplacementNamed(
        locator<NavigationService>().navigatorKey.currentState.overlay.context,
        route);
  } else {
    print("u ugly");
    Navigator.pushNamed(
        locator<NavigationService>().navigatorKey.currentState.overlay.context,
        route);
  }
}

handleBottomTap(index) {
//  context.dispose();

  print("hey");
  var replacement = true;

  if (store.state.currentBottomBarIndex == index) {
    return;
  }
  if (store.state.currentBottomBarIndex == 0 || index == 0) {
    replacement = false;
  }
  print("beauty");
  store.dispatch(SetCurrentBottomBarIndex(index));
  if ( index == 0) {
    print("pooop");
    Navigator.pop(locator<NavigationService>().navigatorKey.currentState.overlay.context);
    return ;
  }
  if (index == 0) {
    callRoute(route: '/mapa', replacement: replacement);
  } else if (index == 1) {
    callRoute(route: '/chat', replacement: replacement);
  } else if (index == 2) {
    callRoute(route: '/bolhas', replacement: replacement);
  } else if (index == 3) {
    callRoute(route: '/playlist', replacement: replacement);
  }
}

_ItemBottomColor(index) {
  return store.state.currentBottomBarIndex == index
      ? Colors.yellowAccent
      : Colors.white;
}
