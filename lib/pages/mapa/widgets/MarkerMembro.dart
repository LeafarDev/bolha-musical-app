import 'package:bolha_musical/model/BolhaMembro.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/dialogPerfil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

Marker MarkerMembro(BolhaMembro membro) {
  var image = store.state.padraoPerfilFoto;
  if (membro.me.images != null) {
    if (membro.me.images.length > 0) {
      image = membro.me.images[0].url;
    }
  }
  return Marker(
    width: 34.0,
    height: 34.0,
    point: LatLng(membro.latitude, membro.longitude),
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
                    image: NetworkImage(image))))),
  );
}
