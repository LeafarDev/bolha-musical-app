import 'dart:convert';
import 'dart:io';

import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BolhaApi {
  static Future<Bolha> getBolhaAtual() async {
    final res = await http.get(
        "http://10.0.0.108:3001/api/v1/spotify/bolhas/atual",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (res.statusCode == 200) {
      Bolha bolha = Bolha.fromJson(res.body);
      store.dispatch(SetBolhaAtual(bolha));
      return bolha;
    } else {
      store.dispatch(SetBolhaAtual(null));
      return null;
    }
  }

  static Future<bool> getBolhasDisponiveis() async {
    final res = await http.get(
        "http://10.0.0.108:3001/api/v1/spotify/bolhas/disponiveis",
        headers: {HttpHeaders.authorizationHeader: store.state.token.token});
    if (res.statusCode == 200) {
      var bolhasRaw = jsonDecode(res.body);
      store.dispatch(SetBolhasDisponiveis(new List<Bolha>.from(
          bolhasRaw.map((model) => Bolha.fromJson(jsonEncode(model))))));
      return true;
    } else {
      store.dispatch(SetBolhasDisponiveis([]));
    }
    return false;
  }

  static Future<Bolha> criarBolha(apelido) async {
    String data = jsonEncode({'apelido': apelido});
    final res = await http.post("http://10.0.0.108:3001/api/v1/spotify/bolhas",
        headers: {
          HttpHeaders.authorizationHeader: store.state.token.token,
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: data);
    if (res.statusCode == 200) {
      Bolha bolha = Bolha.fromJson(res.body);
      store.dispatch(SetBolhaAtual(bolha));
      return bolha;
    } else {
      return null;
    }
  }

  static errorDialog(message) {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context,
        builder: (BuildContext context) => FancyDialog(
              cancel: "Cancelar...",
              gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
              title: "Erro...",
              descreption: message != null
                  ? message
                  : "Não consegui realizar esta operação...",
              cancelFun: () {
                print("cancelFun");
              },
            ));
  }

  static sucessoDialog(message) {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context,
        builder: (BuildContext context) => FancyDialog(
              cancel: "Cancelar...",
              gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
              title: "Feito!",
              descreption: message != null
                  ? message
                  : "Não consegui realizar esta operação...",
              cancelFun: () {
                print("cancelFun");
              },
            ));
  }

  static entrarBolha(id) async {
    String data = jsonEncode({'id': id});
    final res =
        await http.post("http://10.0.0.108:3001/api/v1/spotify/bolhas/entrar",
            headers: {
              HttpHeaders.authorizationHeader: store.state.token.token,
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: data);
    var body = res.body;
    if (res.statusCode == 200) {
      sucessoDialog("Agora você faz parte de uma nova bolha :D");
      Bolha bolha = Bolha.fromJson(res.body);
      store.dispatch(SetBolhaAtual(bolha));
      return bolha;
    } else {
      var backendMessage = BackendMessage.fromJson(body);
      errorDialog(backendMessage.message);
      return backendMessage;
    }
  }

  static sairBolha() async {
    final res = await http
        .post("http://10.0.0.108:3001/api/v1/spotify/bolhas/sair", headers: {
      HttpHeaders.authorizationHeader: store.state.token.token,
      HttpHeaders.contentTypeHeader: "application/json"
    });
    var body = res.body;
    if (res.statusCode == 200) {
      sucessoDialog("Saiu com sucesso da bolha :)");
    } else {
      var backendMessage = BackendMessage.fromJson(body);
      errorDialog(backendMessage.message);
      return backendMessage;
    }
  }
}
