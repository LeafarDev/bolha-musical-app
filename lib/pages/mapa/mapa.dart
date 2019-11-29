import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/pages/mapa/widgets/CircleMarker.dart';
import 'package:bolha_musical/pages/mapa/widgets/MarkerMembro.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/bottomBar.dart';
import 'package:bolha_musical/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:latlong/latlong.dart';
import 'package:user_location/user_location.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => new _MapaState();
}

class _MapaState extends State<Mapa> {
  Bolha _bolhaAtual = null;
  double _progressValue = 0.0;
  Timer _timer;
  MapController mapController = MapController();
  int _currentBottomBarIndex = 0;
  Future<AuthState> authState;
  List<Marker> locationMarker = [];

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  Future<void> initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      setState(() {
        _bolhaAtual = store.state.bolhaAtual;
        BolhaApi.getBolhaAtual();
        // print(mapController.center.latitude);
        // print(mapController.center.longitude);
        Localizacao _localizacao = new Localizacao((b) => b
          ..latitude = mapController.center.latitude
          ..longitude = mapController.center.longitude);
        store.dispatch(SetLocalizacaoAtual(_localizacao));
        UsersApi.enviarLocalizacaoAtual();
        print(_localizacao);

        if (_progressValue > 0.7) {
          _progressValue = 0.0;
        } else {
          _progressValue += 0.1;
        }
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                    CircleLayerOptions(
                        circles: [CircleMarkerMapa(_bolhaAtual)]),
                    MarkerLayerOptions(
                        markers: _bolhaAtual != null
                            ? [
                                ..._bolhaAtual.membros
                                    .map((membro) => MarkerMembro(membro))
                                    .toList(),
                                ...locationMarker
                              ]
                            : []),
                    UserLocationOptions(
                      context: context,
                      mapController: mapController,
                      markers: locationMarker,
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
        items: bottomBarList(),
        onTap: (index) {
          handleBottomTap(index);
        },
      ),
    );
  }
}
