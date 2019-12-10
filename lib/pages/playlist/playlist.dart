import 'dart:async';

import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/pages/playlist/widgets/playlist_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:bolha_musical/widgets/bottomBar.dart';
import 'package:bolha_musical/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
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
          body: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) {
                return SafeArea(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: state.playlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 44.0,
                            child: FadeInAnimation(
                              child: PlayListItem(
                                  key: UniqueKey(),
                                  width: MediaQuery.of(context).size.width,
                                  height: 70.0,
                                  track: state.playlist[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
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
