import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayListSearchItem extends StatelessWidget {
  final double width;
  final double height;
  final Track track;

  const PlayListSearchItem({Key key, this.width, this.height, this.track})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(0, 0, 0, 0),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  track.album.images != null
                      ? track.album.images[0].url
                      : store.state.padraoPerfilFoto)),
          subtitle: Text(
            track.album.shortname(),
            style: TextStyle(color: Colors.white),
          ),
          title: Text(
            track.shortname(),
            style: TextStyle(color: Colors.white),
          ),
          trailing: _iconButtonBuild(context),
        ),
      ),
    );
  }

  _iconButtonBuild(context) {
    // TODO: remover add button quando já estiver adicionado
    return Material(
        color: Colors.transparent,
        child: RawMaterialButton(
          onPressed: () async {
            var result = await TrackApi.addTrack(track.id);
            if (result != null) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content:
                    Text("`${track.shortname()}` foi adicionado com sucesso"),
              ));
            }
          },
          child: Icon(
            Icons.add,
            color: Colors.grey,
          ),
          elevation: 0,
          shape: CircleBorder(),
          splashColor: Colors.grey,
          fillColor: Color.fromRGBO(0, 0, 0, 0),
        ));
  }
}
