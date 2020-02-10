import 'dart:async';

import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/pages/mapa/widgets/CircleMarker.dart';
import 'package:bolha_musical/pages/mapa/widgets/MarkerMembro.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/player_bar.dart';
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
  Timer _timer;
  MapController _mapController = MapController();
  List<Marker> _locationMarker = [];

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _locationMarker.clear();
  }

  @override
  initState() {
    super.initState();
    _bolhaAtual = store.state.bolhaAtual;
    BolhaApi.getBolhaAtual();
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        _bolhaAtual = store.state.bolhaAtual;
      });
    });
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
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: FlutterMap(
                    key: UniqueKey(),
                    options: MapOptions(
                      center: LatLng(51.5, -0.09),
                      maxZoom: 16.0,
                      minZoom: 8.0,
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
                      if (_bolhaAtual != null)
                        CircleLayerOptions(
                            circles: [CircleMarkerMapa(_bolhaAtual)]),
                      MarkerLayerOptions(
                          markers: _bolhaAtual != null
                              ? [
                                  ..._bolhaAtual.membros
                                      .where((m) =>
                                          m.mostrar_localizacao_mapa != false)
                                      .toList()
                                      .map((membro) => MarkerMembro(membro))
                                      .toList(),
                                ]
                              : _locationMarker),
                      UserLocationOptions(
                        context: context,
                        mapController: _mapController,
                        markers: _locationMarker,
                      ),
                    ],
                    mapController: _mapController,
                  ),
                ),
                PlayerBar()
              ],
            ),
          ),
        ));
  }
}
