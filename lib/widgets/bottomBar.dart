

import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomBarList() {
  return [BottomNavigationBarItem(
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
        )),];
}

handleBottomTap (index) {
  store.dispatch(SetCurrentBottomBarIndex(index));

  if (index == 0) {
    locator<NavigationService>().navigateTo('/mapa');
  } else if (index == 1) {
    locator<NavigationService>().navigateTo('/chat');
  } else if (index == 2) {
    locator<NavigationService>().navigateTo('/bolhas');
  } else {}
}
_ItemBottomColor(index) {

  return store.state.currentBottomBarIndex == index ? Colors.yellowAccent : Colors.white;
}