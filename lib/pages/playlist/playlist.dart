import 'dart:async';

import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/pages/playlist/widgets/playlist_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:highlighter_coachmark/highlighter_coachmark.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicorndial/unicorndial.dart';

class Playlist extends StatefulWidget {
  @override
  PlaylistState createState() {
    return PlaylistState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class PlaylistState extends State<Playlist> {
  Timer _timer;
  List _childButtons = List<UnicornButton>();
  GlobalKey _fabKey = GlobalObjectKey("fab");

  @override
  initState() {
    super.initState();

    setState(() {
      _childButtons.add(UnicornButton(
          hasLabel: true,
          labelText: "Nova música_",
          currentButton: FloatingActionButton(
            heroTag: "train",
            backgroundColor: Colors.redAccent,
            mini: true,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(
                  locator<NavigationService>()
                      .navigatorKey
                      .currentState
                      .overlay
                      .context,
                  '/track-search');
            },
          )));
    });
    TrackApi.playlist();
    _timer = Timer.periodic(Duration(seconds: 15), (_) {
      TrackApi.playlist();
    });
    _handleShowFab();
  }

  _handleShowFab() async {
    final prefs = await SharedPreferences.getInstance();
    var jaViu = prefs.getString('ja-viu-tutorial-add-playlist') ?? null;
    if (jaViu == null && store.state.bolhaAtual != null) {
      prefs.setString('ja-viu-tutorial-add-playlist', "1");
      Timer(Duration(seconds: 1), () => showCoachMarkFAB());
    }
  }

  void showCoachMarkFAB() {
    CoachMark coachMarkFAB = CoachMark();
    RenderBox target = _fabKey.currentContext.findRenderObject();

    Rect markRect = target.localToGlobal(Offset.zero) & target.size;
    markRect = Rect.fromCircle(
        center: Offset(markRect.left + 30.0, markRect.bottom - 55.0),
        radius: markRect.longestSide * 0.05);

    coachMarkFAB.show(
      targetContext: _fabKey.currentContext,
      markRect: markRect,
      children: [
        Positioned(
            top: markRect.top - 55.0,
            right: 10.0,
            child: Text("Aperte para adicionar uma música",
                style: const TextStyle(
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                )))
      ],
      duration: null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  _indexAtivo(lista) {
    for (var i = 0; i < lista.length; i++) {
      if (lista[i].current_playing == 1) {
        return i;
      }
    }
    return 0;
  }

  _unicornDialer() {
    if (store.state.bolhaAtual != null) {
      return UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.redAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.arrow_upward),
          childButtons: _childButtons);
    }
    return Container(
      height: 0,
      width: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          floatingActionButton: Padding(
            key: _fabKey,
            padding: EdgeInsets.only(bottom: 30),
            child: _unicornDialer(),
          ),
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: StoreConnector<AppState, AppState>(
                      distinct: true,
                      converter: (store) => store.state,
                      builder: (context, state) {
                        if (state.playlist.length > 0) {
                          var indexAtivo = _indexAtivo(state.playlist);
                          return AnimationLimiter(
                            child: ScrollablePositionedList.builder(
                              initialScrollIndex: indexAtivo,
                              padding: const EdgeInsets.all(8.0),
                              itemCount: state.playlist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PlaylistItem(state.playlist[index]);
                              },
                            ),
                          );
                        }
                        var msg =
                            "Nada aqui ainda, tente adicionar uma nova música na bolha ;)";
                        if (state.bolhaAtual == null) {
                          msg =
                              "Nada aqui ainda, entre em uma bolha para adicionar músicas";
                        }
                        return Center(
                          child: Text(
                            msg,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                ),
                PlayerBar()
              ],
            ),
          )),
    );
  }
}
