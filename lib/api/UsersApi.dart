import 'dart:convert';
import 'dart:io';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/model/ValidationError.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

import 'ApiDialogs.dart';

class UsersApi {
  static Future<AuthState> getAuthState() async {
    try {
      final res = await http
          .get("http://10.0.0.108:3001/api/v1/spotify/login/codigo/novo");
      if (res.statusCode == 200) {
        AuthState authstate = AuthState.fromJson(res.body);
        return authstate;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  static Future<Token> getToken() async {
    try {
      final res = await http.get(
          "http://10.0.0.108:3001/api/v1/spotify/state/trocar/token?state=${store.state.authState.id}");
      if (res.statusCode == 200) {
        Token tokenDto = Token.fromJson(res.body);
        return tokenDto;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<Me> getMe() async {
    try {
      final resMe = await http.get("http://10.0.0.108:3001/api/v1/users/me",
          headers: {HttpHeaders.authorizationHeader: store.state.token.token});
      if (resMe.statusCode == 200) {
        Me me = Me.fromJson(resMe.body);
        return me;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static Future<bool> enviarLocalizacaoAtual() async {
    String localizacaoJson = store.state.localizacaoAtual.toJson();
    try {
      final res = await http.post(
          "http://10.0.0.108:3001/api/v1/users/localizacao/atual",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: localizacaoJson);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  static Future<bool> ping() async {
    try {
      final resMe = await http.get(
          "http://10.0.0.108:3001/api/v1/spotify/refresh/teste",
          headers: {HttpHeaders.authorizationHeader: store.state.token.token});
      if (resMe.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return null;
    }
  }

  static devices() async {
    try {
      final res = await http
          .get("http://10.0.0.108:3001/api/v1/users/devices", headers: {
        HttpHeaders.authorizationHeader: store.state.token.token,
        HttpHeaders.contentTypeHeader: "application/json"
      });
      if (res.statusCode == 200) {
        var raw = jsonDecode(res.body);
        store.dispatch(SetDevices(new List<Device>.from(
            raw.map((model) => Device.fromJson(jsonEncode(model))))));
        return true;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static updateDevice(device_id) async {
    String data = jsonEncode({'device_id': device_id});
    final res = await http.put("http://10.0.0.108:3001/api/v1/users/devices",
        headers: {
          HttpHeaders.authorizationHeader: store.state.token.token,
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: data);
    var body = res.body;
    if (res.statusCode == 200) {
      return true;
    } else {
      var backendMessage = BackendMessage.fromJson(body);
      ApiDialogs.errorDialog(backendMessage.message);
      return null;
    }
  }

  static updatePreferences(language_code, mostrar_localizacao_mapa,
      tocar_track_automaticamente) async {
    String data = jsonEncode(
      {
        'language_code': language_code,
        'mostrar_localizacao_mapa': mostrar_localizacao_mapa,
        'tocar_track_automaticamente': tocar_track_automaticamente
      },
    );
    final res =
        await http.put("http://10.0.0.108:3001/api/v1/users/preferences",
            headers: {
              HttpHeaders.authorizationHeader: store.state.token.token,
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: data);
    if (res.statusCode == 200) {
      return true;
    } else if (res.statusCode == 422) {
      var validationError = new ValidationError();
      validationError.record(jsonDecode(res.body));
      return validationError;
    } else {
      var backendMessage = BackendMessage.fromJson(res.body);
      ApiDialogs.errorDialog(backendMessage.message);
      return null;
    }
  }

  static following(id) async {
    try {
      final res = await http.get(
          "http://10.0.0.108:3001/api/v1/users/following/contains?id=${id}",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          });
      if (res.statusCode == 200) {
        var resultado = jsonDecode(res.body);
        return resultado["seguindo"];
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static follow(id) async {
    try {
      final res = await http.put("http://10.0.0.108:3001/api/v1/users/follow",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: jsonEncode({"id": id}));
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  static unfollow(id) async {
    try {
      final res = await http.put("http://10.0.0.108:3001/api/v1/users/unfollow",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: jsonEncode({"id": id}));
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
