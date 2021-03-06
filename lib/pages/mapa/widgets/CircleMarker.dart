import 'package:bolha_musical/model/Bolha.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

CircleMarker CircleMarkerMapa(Bolha bolha) {
  return CircleMarker(
      //radius marker
      point: LatLng(bolha != null ? bolha.latitude : 0,
          bolha != null ? bolha.longitude : 0),
      color: Color(int.parse(bolha.cor != null ? bolha.cor : Colors.green))
          .withOpacity(0.2),
      borderStrokeWidth: 3.0,
      borderColor: Colors.green,
      useRadiusInMeter: true,
      radius: bolha != null ? bolha.raio : 300 // metros
      );
}
