import 'dart:async';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/app_state.dart';
import 'package:bolha_musical/widgets/dialogPerfil.dart';
import 'package:bolha_musical/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:latlong/latlong.dart';
import 'package:redux/redux.dart';
import 'package:user_location/user_location.dart';

class Mapa extends StatefulWidget {
  final Store<AppState> store;

  Mapa({this.store});

  @override
  _MapaState createState() => new _MapaState(store: store);
}

class _MapaState extends State<Mapa> {
  final Store<AppState> store;
  Marker _marker;
  Timer _timer;
  int _markerIndex = 0;
  MapController mapController = MapController();
  List<Marker> markers = [];

  _MapaState({this.store});

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  Future<AuthState> authState;

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  void initState() {
    super.initState();
    print("EU SOU O MAP MUAHAHAHHAHAHAH");
    if (store.state.token.token == null) {
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => Mapa(store: store)),
//      );
    }
    _marker = _markers[_markerIndex];
    markers.add(_marker);
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      setState(() {
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
        backgroundColor: Colors.teal,
      ),
      drawer: HomeDrawer(store: store),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return FlutterMap(
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
          );
        },
      ),
    );
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
