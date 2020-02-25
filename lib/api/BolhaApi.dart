import 'dart:convert';
import 'dart:io';

import 'package:bolha_musical/model/BackendMessage.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/ReferenciaTamanhoBolha.dart';
import 'package:bolha_musical/model/ValidationError.dart';
import 'package:bolha_musical/pages/app.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

import 'ApiDialogs.dart';

class BolhaApi {
  static Future<Bolha> getBolhaAtual() async {
    try {
      final res = await http.get(
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/atual",
          headers: {HttpHeaders.authorizationHeader: store.state.token.token});
      if (res.statusCode == 200) {
        Bolha bolha = Bolha.fromJson(res.body);
        store.dispatch(SetBolhaAtual(bolha));
        return bolha;
      } else {
        store.dispatch(SetBolhaAtual(null));
        store.dispatch(SetPlaylist([]));
        store.dispatch(SetMessages([]));
        return null;
      }
    } catch (error) {
      print(error);
    }
  }

  static Future<bool> getReferenciaTamanhoBolha() async {
    try {
      final res = await http.get(
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/referencias",
          headers: {HttpHeaders.authorizationHeader: store.state.token.token});
      if (res.statusCode == 200) {
        var referenciasRaw = jsonDecode(res.body);
        store.dispatch(SetReferenciasTamanhoBolha(
            List<ReferenciaTamanhoBolha>.from(referenciasRaw.map((model) =>
                ReferenciaTamanhoBolha.fromJson(jsonEncode(model))))));

        return true;
      } else {
        store.dispatch(SetReferenciasTamanhoBolha([]));
      }
      return false;
    } catch (error) {
      return null;
    }
  }

  static Future<bool> getBolhasDisponiveis() async {
    try {
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
    } catch (error) {
      return null;
    }
  }

  static criarBolha(Bolha bolha) async {
    try {
      final res =
          await http.post("http://10.0.0.108:3001/api/v1/spotify/bolhas",
              headers: {
                HttpHeaders.authorizationHeader: store.state.token.token,
                HttpHeaders.contentTypeHeader: "application/json"
              },
              body: bolha.toJson());
      if (res.statusCode == 200) {
        Bolha bolha = Bolha.fromJson(res.body);
        return bolha;
      } else if (res.statusCode == 422) {
        var validationError = new ValidationError();
        validationError.record(jsonDecode(res.body));
        return validationError;
      } else {
        var backendMessage = BackendMessage.fromJson(res.body);
        ApiDialogs.errorDialog(backendMessage.message);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  static entrarBolha(id) async {
    String data = jsonEncode({'id': id});
    try {
      final res =
          await http.post("http://10.0.0.108:3001/api/v1/spotify/bolhas/entrar",
              headers: {
                HttpHeaders.authorizationHeader: store.state.token.token,
                HttpHeaders.contentTypeHeader: "application/json"
              },
              body: data);
      var body = res.body;
      if (res.statusCode == 200) {
        Bolha bolha = Bolha.fromJson(res.body);
        ApiDialogs.sucessoDialog(
            "Agora você faz parte de uma nova bolha, tente adicionar umas músicas :D");
        store.dispatch(SetBolhaAtual(null));
        store.dispatch(SetPlaylist([]));
        store.dispatch(SetMessages([]));
        store.dispatch(SetBolhaAtual(bolha));
        App.chatSocket.startSocketChannel();
        return bolha;
      } else {
        var backendMessage = BackendMessage.fromJson(body);
        ApiDialogs.errorDialog(backendMessage.message);
        return backendMessage;
      }
    } catch (error) {
      return null;
    }
  }

  static sairBolha() async {
    try {
      final res = await http
          .post("http://10.0.0.108:3001/api/v1/spotify/bolhas/sair", headers: {
        HttpHeaders.authorizationHeader: store.state.token.token,
        HttpHeaders.contentTypeHeader: "application/json"
      });
      var body = res.body;
      if (res.statusCode == 200) {
        ApiDialogs.sucessoDialog("Saiu com sucesso da bolha :)");
        store.dispatch(SetBolhaAtual(null));
        store.dispatch(SetPlaylist([]));
        store.dispatch(SetMessages([]));
        store.dispatch(SetCurrentPlaying(null));
      } else {
        var backendMessage = BackendMessage.fromJson(body);
        ApiDialogs.errorDialog(backendMessage.message);
        return backendMessage;
      }
    } catch (error) {
      return null;
    }
  }

  static expulsarBolha(id) async {
    String data = jsonEncode({'id': id});
    try {
      final res = await http.post(
          "http://10.0.0.108:3001/api/v1/spotify/bolhas/membro/expulsar",
          headers: {
            HttpHeaders.authorizationHeader: store.state.token.token,
            HttpHeaders.contentTypeHeader: "application/json"
          },
          body: data);
      if (res.statusCode == 200) {
        getBolhaAtual();
        return true;
      } else {
        var body = res.body;
        var backendMessage = BackendMessage.fromJson(body);
        ApiDialogs.errorDialog(backendMessage.message);
        return false;
      }
    } catch (error) {
      return null;
    }
  }
}
