import 'dart:convert';
import 'dart:io';

import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/SearchTrackResult.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:bolha_musical/model/Voto.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

import 'ApiDialogs.dart';

class TrackApi {
  static search(search) async {
    try {
      store.dispatch(SetSearchingTrack(true));
      final res = await http.get(
          "http://10.0.0.108:3001/api/v1/spotify/search?query=${search}",
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
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/playlist/track",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: data);
      if (res.statusCode == 200) {
        return true;
      } else {
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
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/playlist",
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
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/playlist/current-playing",
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

  static votar(Voto voto) async {
    try {
      final res = await http.post(
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/playlist/track/votar",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: voto.toJson());
      if (res.statusCode == 200) {
        return true;
      } else {
        print(res.body);
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
