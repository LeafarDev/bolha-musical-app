import 'dart:convert';
import 'dart:io';

import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

class BolhaApi {
  static Future<Bolha> getBolhaAtual() async {
    final res = await http.get(
        "http://10.0.0.108:3001/api/spotify/bolhas/atual",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (res.statusCode == 200) {
      Bolha bolha = Bolha.fromJson(res.body);
      store.dispatch(SetBolhaAtual(bolha));
      return bolha;
    } else {
      return null;
    }
  }

  static Future<bool> getBolhasDisponiveis() async {
    print("u ?");
    final res = await http.get(
        "http://10.0.0.108:3001/api/spotify/bolhas/disponiveis",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (res.statusCode == 200) {
      var bolhasRaw = jsonDecode(res.body);

      store.dispatch(SetBolhasDisponiveis(new List<Bolha>.from(
          bolhasRaw.map((model) => Bolha.fromJson(jsonEncode(model))))));
      return true;
    }
    return false;
  }
}
