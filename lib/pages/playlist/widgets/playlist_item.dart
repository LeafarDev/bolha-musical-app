import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/pages/playlist/widgets/voto_dialog.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final Track _track;
  final VoidCallback onTap;

  PlaylistItem(this._track, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 1.0),
          width: MediaQuery.of(context).size.width,
          height: 70.0,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      _track.album.images != null
                          ? _track.album.images[0].url
                          : store.state.padraoPerfilFoto)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _track.name,
                        style: TextStyle(
                            color:
                                _currentPlayingColor(_track.current_playing)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _track.artists[0].name,
                        style: TextStyle(
                            color:
                                _currentPlayingColor(_track.current_playing)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    _durationMinutes(_track.durationMs),
                    style: TextStyle(
                        color: _currentPlayingColor(_track.current_playing)),
                  )),
              Icon(
                Icons.favorite,
                color: _track.saved ? Colors.red : Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (_track.usuarioAtualCimaVotou()) {
                          TrackApi.votar({
                            "refletir_spotify": false,
                            "cimavoto": -1,
                            "track_interno_id": _track.id_interno
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  VotoDialog(true, _track.id_interno));
                        }
                      },
                      child: Icon(
                        Icons.thumb_up,
                        color: _track.usuarioAtualCimaVotou()
                            ? Colors.green
                            : Colors.white30,
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (_track.usuarioAtualBaixaVotou()) {
                          TrackApi.votar({
                            "refletir_spotify": false,
                            "cimavoto": -1,
                            "track_interno_id": _track.id_interno
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  VotoDialog(false, _track.id_interno));
                        }
                      },
                      child: Icon(
                        Icons.thumb_down,
                        color: _track.usuarioAtualBaixaVotou()
                            ? Colors.red
                            : Colors.white30,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _durationMinutes(durationMs) {
    var duration = DateTime.fromMillisecondsSinceEpoch(durationMs);
    return DateFormat('mm:ss').format(duration);
  }

  _currentPlayingColor(current_playing) {
    if (current_playing == 1) {
      return Colors.yellowAccent;
    } else {
      return Colors.white;
    }
  }
}
