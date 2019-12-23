import 'dart:async';

import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerBar extends StatefulWidget {
  @override
  _PlayerBarState createState() => new _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  Track _trackAtual = null;
  double _progressValue = 0.0;
  Timer _timer;

  @override
  initState() {
    super.initState();
    _currentProgress();
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _currentProgress();
    });
  }

  _currentProgress() async {
    await TrackApi.currentPlaying();
    _trackAtual = store.state.currentPlaying;
    if (_trackAtual != null) {
      final started_at = DateTime.parse(_trackAtual.started_at);
      final durationMs = _trackAtual.durationMs;
      final agora = DateTime.now();
      final decorrido = agora.difference(started_at).inMilliseconds;
          // print(_progressValue);
      _progressValue = decorrido / durationMs;
      return;
    }
    _trackAtual = null;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromRGBO(1, 41, 51, 1),
      height: 39,
      child: Column(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
            value: _progressValue,
          ),
          Padding(
              padding: EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 110, right: 30),
                    child: Text(
                        _trackAtual != null
                            ? _trackAtual.shortname(textSize: 25)
                            : "...".padRight(34, " "),
                        style: TextStyle(color: Colors.white)),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 36),
                    child: Icon(
                      Icons.pause_circle_filled,
                      color: Colors.white,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
