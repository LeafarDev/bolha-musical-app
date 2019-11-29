import 'dart:io';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

class UsersApi {
  static Future<AuthState> getAuthState() async {
    final res =
        await http.get("http://10.0.0.108:3001/api/spotify/login/codigo/novo");
    if (res.statusCode == 200) {
      AuthState authstate = AuthState.fromJson(res.body);
      return authstate;
    }
    return null;
  }

  static Future<Token> getToken() async {
    final res = await http.get(
        "http://10.0.0.108:3001/api/spotify/state/trocar/token?state=${store.state.authState.id}");
    if (res.statusCode == 200) {
      Token tokenDto = Token.fromJson(res.body);
      return tokenDto;
    } else {
      return null;
    }
  }

  static Future<Me> getMe() async {
    final resMe = await http.get("http://10.0.0.108:3001/api/users/me",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (resMe.statusCode == 200) {
      Me me = Me.fromJson(resMe.body);
      print("sucesso me");
      print(store.state.token.token);
      print(resMe.body);
      return me;
    } else {
      print(resMe.body);
      return null;
    }
  }

  static Future<bool> enviarLocalizacaoAtual() async {
    String localizacaoJson = store.state.localizacaoAtual.toJson();
    final res =
        await http.post("http://10.0.0.108:3001/api/users/localizacao/atual",
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
}
