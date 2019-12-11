import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/pages/mapa/widgets/CircleMarker.dart';
import 'package:bolha_musical/pages/mapa/widgets/MarkerMembro.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/bottomBar.dart';
import 'package:bolha_musical/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
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
  Future<AuthState> authState;
  List<Marker> locationMarker = [];

  @override
  State<StatefulWidget> createState() {
    return null;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        _bolhaAtual = store.state.bolhaAtual;
        BolhaApi.getBolhaAtual();
        if (locationMarker.length > 0) {
          if (store.state.localizacaoAtual.latitude !=
                  locationMarker[0].point.latitude &&
              store.state.localizacaoAtual.longitude !=
                  locationMarker[0].point.longitude) {
            Localizacao _localizacao = new Localizacao((b) => b
              ..latitude = locationMarker[0].point.latitude
              ..longitude = locationMarker[0].point.longitude);
            store.dispatch(SetLocalizacaoAtual(_localizacao));
            UsersApi.enviarLocalizacaoAtual();
          }
        }

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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Mapa'),
            backgroundColor: Color.fromRGBO(1, 41, 51, 1),
          ),
          drawer: HomeDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 176,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.5, -0.09),
                    maxZoom: 16.0,
                    minZoom: 15.0,
                    zoom: 15.0,
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
                              ]
                            : locationMarker),
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
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(1, 41, 51, 1),
            currentIndex: 0,
            items: bottomBarList(),
            onTap: (index) {
              handleBottomTap(index);
            },
          ),
        ));
  }
}
