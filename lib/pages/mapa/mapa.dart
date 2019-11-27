import 'dart:async';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:bolha_musical/utils/noAuthRedirect.dart';
import 'package:bolha_musical/widgets/dialogPerfil.dart';
import 'package:bolha_musical/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => new _MapaState();
}

class _MapaState extends State<Mapa> {
  double _progressValue = 0.0;
  Marker _marker;
  Timer _timer;
  int _markerIndex = 0;
  MapController mapController = MapController();
  List<Marker> markers = [];
  int _currentBottomBarIndex = 0;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  Future<AuthState> authState;

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  void initState() {
    super.initState();
    noAuthRedirect();
    _marker = _markers[_markerIndex];
    markers.add(_marker);
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_progressValue > 0.7) {
          _progressValue = 0.0;
        } else {
          _progressValue += 0.1;
        }
        _marker = _markers[_markerIndex];
        _markerIndex = (_markerIndex + 1) % _markers.length;
        markers[markers.indexOf(_marker)] = _markers[_markerIndex];
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        backgroundColor: Color.fromRGBO(1, 41, 51, 1),
      ),
      drawer: HomeDrawer(),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Container(
                height: 610,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.5, -0.09),
                    maxZoom: 16.0,
                    minZoom: 16.0,
                    zoom: 16.0,
                    plugins: [
                      // ADD THIS
                      UserLocationPlugin(),
                    ],
                  ),
                  layers: [
                    TileLayerOptions(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c']),
                    CircleLayerOptions(circles: [
                      CircleMarker(
                          //radius marker
                          point: LatLng(-23.4220974, -46.499184718),
                          color: Colors.lightGreenAccent.withOpacity(0.1),
                          borderStrokeWidth: 3.0,
                          borderColor: Colors.green,
                          useRadiusInMeter: true,
                          radius: 500 // metros
                          )
                    ]),
                    MarkerLayerOptions(markers: markers),
                    UserLocationOptions(
                      context: context,
                      mapController: mapController,
                      markers: markers,
                    ),
                  ],
                  mapController: mapController,
                ),
              ),
              Container(
                color: Color.fromRGBO(1, 41, 51, 1),
                height: 39,
                child: Column(
                  children: <Widget>[
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
                      value: _progressValue,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Fight The Power - Public Enemy",
                                style: TextStyle(color: Colors.white)),
                            Icon(
                              Icons.pause_circle_filled,
                              color: Colors.white,
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(1, 41, 51, 1),
        currentIndex: _currentBottomBarIndex,
        items: [
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
        ],
        onTap: (index) {
          if (index == 2) {
            locator<NavigationService>().navigateTo('/bolhas');
          } else {}
        },
      ),
    );
  }

  _ItemBottomColor(index) {
    return _currentBottomBarIndex == index ? Colors.yellowAccent : Colors.white;
  }
}

List<Marker> _markers = [
  Marker(
    width: 34.0,
    height: 34.0,
    point: LatLng(-23.4220974, -46.499184718),
    builder: (ctx) => Container(
        child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showCustomDialogWithImage(ctx);
      },
      child: FlutterLogo(
        colors: Colors.green,
      ),
    )),
  ),
  Marker(
    width: 34.0,
    height: 34.0,
    point: LatLng(-23.422565, -46.498943318),
    builder: (ctx) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          showCustomDialogWithImage(ctx);
        },
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://profile-images.scdn.co/images/userprofile/default/817641f61b9543e2a0faf1e43ab86b447bd86c1d"))))),
  ),
  Marker(
    width: 34.0,
    height: 34.0,
    point: LatLng(-23.4235455, -46.497802318),
    builder: (ctx) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          showCustomDialogWithImage(ctx);
        },
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://profile-images.scdn.co/images/userprofile/default/817641f61b9543e2a0faf1e43ab86b447bd86c1d"))))),
  ),
];
