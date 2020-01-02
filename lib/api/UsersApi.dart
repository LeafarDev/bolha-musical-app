import 'dart:convert';
import 'dart:io';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

import 'ApiDialogs.dart';

class UsersApi {
  static Future<AuthState> getAuthState() async {
    final res = await http
        .get("http://10.0.0.108:3001/api/v1/spotify/login/codigo/novo");
    if (res.statusCode == 200) {
      AuthState authstate = AuthState.fromJson(res.body);
      return authstate;
    }
    return null;
  }

  static Future<Token> getToken() async {
    final res = await http.get(
        "http://10.0.0.108:3001/api/v1/spotify/state/trocar/token?state=${store.state.authState.id}");
    if (res.statusCode == 200) {
      Token tokenDto = Token.fromJson(res.body);
      return tokenDto;
    } else {
      return null;
    }
  }

  static Future<Me> getMe() async {
    final resMe = await http.get("http://10.0.0.108:3001/api/v1/users/me",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (resMe.statusCode == 200) {
      Me me = Me.fromJson(resMe.body);
      print("sucesso me");
      print(resMe.body);
      return me;
    } else {
      return null;
    }
  }

  static Future<bool> enviarLocalizacaoAtual() async {
    String localizacaoJson = store.state.localizacaoAtual.toJson();
    final res =
        await http.post("http://10.0.0.108:3001/api/v1/users/localizacao/atual",
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
  }

  static Future<bool> ping() async {
    final resMe = await http.get(
        "http://10.0.0.108:3001/api/v1/spotify/refresh/teste",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (resMe.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static devices() async {
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

}
