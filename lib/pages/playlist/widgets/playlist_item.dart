import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayListItem extends StatelessWidget {
  final double width;
  final double height;
  final Track track;

  const PlayListItem({Key key, this.width, this.height, this.track})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
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
          selected: track.current_playing == 1,
          leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(track.album.images != null
                  ? track.album.images[0].url
                  : store.state.padraoPerfilFoto)),
          subtitle: Text(track.album.shortname()),
          title: Text(track.shortname()),
          trailing: iconButtonBuild(context),
        ),
      ),
    );
  }

  iconButtonBuild(context) {
    // TODO: remover add button quando já estiver adicionado
    return Material(
        color: Colors.transparent,
        child: RawMaterialButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Adicionado'),
            ));
          },
          child: Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
          elevation: 0,
          shape: CircleBorder(),
          splashColor: Colors.grey,
          fillColor: Colors.white,
        ));
  }
}
