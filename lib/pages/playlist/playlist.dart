import 'dart:async';

import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/pages/playlist/widgets/playlist_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:bolha_musical/widgets/bottomBar.dart';
import 'package:bolha_musical/widgets/drawer.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

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

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  initState() {
    super.initState();
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
          drawer: HomeDrawer(),
          appBar: AppBar(
              title: Text('Playlist'),
              backgroundColor: Color.fromRGBO(1, 41, 51, 1),
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.pushNamed(
                        locator<NavigationService>()
                            .navigatorKey
                            .currentState
                            .overlay
                            .context,
                        '/track-search');
                  },
                ),
              ]),
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 176,
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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(1, 41, 51, 1),
            currentIndex: store.state.currentBottomBarIndex,
            items: bottomBarList(),
            onTap: (index) {
              handleBottomTap(index);
            },
          )),
    );
  }
}
