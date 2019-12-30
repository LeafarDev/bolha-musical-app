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
      color: Color.fromRGBO(0, 0, 0, 0),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 1.0),
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
          selected: track.current_playing == 1,
          leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  track.album.images != null
                      ? track.album.images[0].url
                      : store.state.padraoPerfilFoto)),
          subtitle: Text(
            track.album.shortname(),
            style: TextStyle(color: _currentPlayingColor(track.current_playing)),
          ),
          title: Text(
            track.shortname(),
            style: TextStyle(color: _currentPlayingColor(track.current_playing)),
          ),
          trailing: _iconButtonBuild(context),
        ),
      ),
    );
  }
  _currentPlayingColor (current_playing) {
    if (current_playing == 1) {
      return Colors.yellowAccent;
    } else {
      return Colors.white;
    }

  }
  _iconButtonBuild(context) {
    // TODO: mudar icone de curtir, quando já curtido
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
          fillColor: Color.fromRGBO(0, 0, 0, 0),
        ));
  }
}
