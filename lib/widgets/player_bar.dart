import 'dart:async';

import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/widgets/device_form.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerBar extends StatefulWidget {
  @override
  _PlayerBarState createState() => new _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  Track _trackAtual = null;
  double _progressValue = 0.0;
  Timer _timer;
  Timer _timerApi;
  IconData _iconeDispositivoAtual;

  @override
  initState() {
    super.initState();
    _trackAtual = store.state.currentPlaying;
    _currentProgress();
    _callApi();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _iconeDispositivoAtual = Icons.device_unknown;
        for (var i = 0; i < store.state.devices.length; i++) {
          if (store.state.devices[i].isActive) {
            _iconeDispositivoAtual = store.state.devices[i].getIcon();
            break;
          }
        }
      });
      _currentProgress();
    });
    _timerApi = Timer.periodic(Duration(seconds: 10), (_) {
      _callApi();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _timerApi.cancel();
  }

  _callApi() async {
    await TrackApi.currentPlaying();
    UsersApi.devices();
    _trackAtual = store.state.currentPlaying;
  }

  _currentProgress() async {
    if (_trackAtual != null) {
      final started_at = DateTime.parse(_trackAtual.started_at);
      final durationMs = _trackAtual.durationMs;
      final agora = DateTime.now();
      final decorrido = agora.difference(started_at).inMilliseconds;
      _progressValue = decorrido / durationMs;
      return;
    }
    _trackAtual = null;
    _progressValue = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(1, 41, 51, 1),
      height: 39,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
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
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => DeviceForm());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 50),
                          child: Icon(
                            _iconeDispositivoAtual,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                            _trackAtual != null
                                ? _trackAtual.shortname(textSize: 20)
                                : "...".padRight(34, " "),
                            style: TextStyle(color: Colors.white)),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 36),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () async {
                            if (state.me.product != 'premium') {
                              Flushbar(
                                icon: Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
                                flushbarPosition: FlushbarPosition.TOP,
                                message:
                                    "O Spotify só permite reproduzir em contas premium :/",
                                duration: Duration(seconds: 3),
                              )..show(context);
                              return;
                            }
                            var result = await UsersApi.updatePreferences(
                                state.me.language_code,
                                state.me.mostrar_localizacao_mapa,
                                !state.me.tocar_track_automaticamente);
                            if (result == true) {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              Me me = await UsersApi.getMe();
                              if (me != null) {
                                // mover para o getMe?
                                prefs.setString('me', me.toJson());
                                store.dispatch(SetME(me));
                              }
                              var messageSuceeso = state
                                          .me.tocar_track_automaticamente ==
                                      true
                                  ? "Não iremos reproduzir no seu spotify"
                                  : "Iremos reproduzir no seu spotify normalmente";
                              Flushbar(
                                icon: Icon(
                                  state.me.tocar_track_automaticamente == true
                                      ? Icons.volume_off
                                      : Icons.volume_up,
                                  color: Colors.white,
                                ),
                                backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
                                flushbarPosition: FlushbarPosition.TOP,
                                message: messageSuceeso,
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          },
                          child: Icon(
                            state.me.tocar_track_automaticamente == true &&
                                    state.me.product == 'premium'
                                ? Icons.volume_up
                                : Icons.volume_off,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
