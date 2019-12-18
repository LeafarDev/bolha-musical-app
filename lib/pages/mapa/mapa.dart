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
  int contador = 0;
  MapController _mapController = MapController();
  List<Marker> _locationMarker = [];

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
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  initState() {
    super.initState();
    _bolhaAtual = store.state.bolhaAtual;
    BolhaApi.getBolhaAtual();
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      setState(() {
        contador = contador + 1;
        print("conta meu contador ${contador}");
        _bolhaAtual = store.state.bolhaAtual;
        if (_bolhaAtual != null) {
          BolhaApi.getBolhaAtual();
        }
        if (_locationMarker.length > 0) {
          if (store.state.localizacaoAtual.latitude !=
                  _locationMarker[0].point.latitude &&
              store.state.localizacaoAtual.longitude !=
                  _locationMarker[0].point.longitude) {
            Localizacao _localizacao = new Localizacao((b) => b
              ..latitude = _locationMarker[0].point.latitude
              ..longitude = _locationMarker[0].point.longitude);
            store.dispatch(SetLocalizacaoAtual(_localizacao));
            UsersApi.enviarLocalizacaoAtual();
          }
        }
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
                    CircleLayerOptions(
                        circles: [CircleMarkerMapa(_bolhaAtual)]),
                    MarkerLayerOptions(
                        markers: _bolhaAtual != null
                            ? [
                                ..._bolhaAtual.membros
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
