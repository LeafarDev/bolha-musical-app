import 'dart:async';

import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/pages/playlist/widgets/playlist_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
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
  int cont = 0;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  List _childButtons = List<UnicornButton>();

  @override
  State<StatefulWidget> createState() {
    return null;
  }

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
      setState(() {
        cont = cont + 1;
        TrackApi.playlist();
      });
    });
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

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: UnicornDialer(
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                parentButtonBackground: Colors.redAccent,
                orientation: UnicornOrientation.VERTICAL,
                parentButton: Icon(Icons.arrow_upward),
                childButtons: _childButtons),
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
                          return AnimationLimiter(
                            child: ScrollablePositionedList.builder(
                              initialScrollIndex: state.playlist.length > 0
                                  ? _indexAtivo(state.playlist)
                                  : 0,
                              padding: const EdgeInsets.all(8.0),
                              itemCount: state.playlist.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PlayListItem(
                                    key: UniqueKey(),
                                    width: MediaQuery.of(context).size.width,
                                    height: 70.0,
                                    track: state.playlist[index]);
                              },
                            ),
                          );
                        }
                        return Center(
                          child: Text("Nada aqui ainda ;)"),
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
