import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/SearchTrackResult.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/model/Voto.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ApiDialogs.dart';

class TrackApi {
  static search(search) async {
    try {
      store.dispatch(SetSearchingTrack(true));
      final res = await http.get(
          store.state.base_url +"spotify/search?query=${search}",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          });
      store.dispatch(SetSearchingTrack(false));
      if (res.statusCode == 200) {
        SearchTrackResult result = SearchTrackResult.fromJson(res.body);
        store.dispatch(
            setLastSearchResult(SearchTrackResult.fromJson(res.body)));
        return result;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static addTrack(trackId) async {
    String data = jsonEncode({'id': trackId});
    try {
      final res = await http.post(
          store.state.base_url +"spotify/bolhas/playlist/track",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: data);
      if (res.statusCode == 200) {
        playlist();
        return true;
      } else {
        var backendMessage = BackendMessage.fromJson(res.body);
        ApiDialogs.errorDialog(backendMessage.message);
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }

  static skip() async {
    try {
      final res = await http.post(
          store.state.base_url +"spotify/bolhas/playlist/skip",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          });
      if (res.statusCode == 200) {
        var backendMessage = BackendMessage.fromJson(res.body);
        Flushbar(
          icon: Icon(Icons.skip_next, color: Colors.white),
          backgroundColor: Color.fromRGBO(1, 41, 51, 0.9),
          flushbarPosition: FlushbarPosition.TOP,
          message: backendMessage.message,
          duration: Duration(seconds: 3),
        )..show(locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context);
        playlist();
        return true;
      } else {
        print(res);
        var backendMessage = BackendMessage.fromJson(res.body);
        ApiDialogs.errorDialog(backendMessage.message);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static playlist() async {
    try {
      final res = await http.get(
          store.state.base_url +"spotify/bolhas/playlist",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          });
      if (res.statusCode == 200) {
        var raw = jsonDecode(res.body);
        store.dispatch(SetPlaylist(new List<Track>.from(
            raw.map((model) => Track.fromJson(jsonEncode(model))))));
        return true;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static currentPlaying() async {
    try {
      final res = await http.get(
          store.state.base_url +"spotify/bolhas/playlist/current-playing",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          });
      if (res.statusCode == 200) {
        store.dispatch(SetCurrentPlaying(Track.fromJson(res.body)));
        return true;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static votar(voto) async {
    try {
      var data;
      if (voto is Voto) {
        data = voto.toJson();
      } else {
        data = jsonEncode(voto);
      }
      final res = await http.post(
          store.state.base_url +"spotify/bolhas/playlist/track/votar",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: data);
      if (res.statusCode == 200) {
        var backendMessage = BackendMessage.fromJson(res.body);
        ApiDialogs.sucessoDialog(backendMessage.message);
        playlist();
        return true;
      } else {
        ApiDialogs.errorDialog("Não consegui realizar esta ação :/");
        print(res.body);
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
