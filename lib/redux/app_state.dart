import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/model/MessageObj.dart';
import 'package:bolha_musical/model/ReferenciaTamanhoBolha.dart';
import 'package:bolha_musical/model/SearchTrackResult.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../model/Me.dart';
import '../model/Token.dart';

class AppState {
  // ENV
  String ws_rocket_chat_url = "ws://bce35ef98c79.ngrok.io/websocket";
  String base_url = "https://4ed3d4f995e9.ngrok.io/api/v1/";
  String client_id = "4c113176ff8542c7a5e39682ebf60f14";

  // OUTROS
  String currentAppState = 'resumed';
  List<ReferenciaTamanhoBolha> referenciasTamanhoBolha = [];
  AuthState authState = AuthState();
  Me me = Me();
  int currentBottomBarIndex = 0;
  Bolha bolhaAtual = null;
  Token token = Token();
  List<Bolha> bolhasDisponiveis = [];
  Localizacao localizacaoAtual = Localizacao((b) => b
    ..latitude = 0.0
    ..longitude = 0.0);
  SearchTrackResult lastSearchResult = SearchTrackResult();
  bool searchingTrack = false;
  List<Track> playlist = [];
  List<Device> devices = [];
  Track currentPlaying = null;
  List<MessageObj> messages = [];
  List<ChatMessage> chatMessages = [];

  // esse será usado pra informar usuário sobre mensagens:
  List<Message> notificacaoMessages = List<Message>();
  String padraoPerfilFoto =
      "https://i.stack.imgur.com/34AD2.jpg";

  AppState();

  AppState.fromAppState(AppState another) {
    authState = another.authState;
    me = another.me;
    token = another.token;
    bolhasDisponiveis = another.bolhasDisponiveis;
    currentBottomBarIndex = another.currentBottomBarIndex;
    bolhaAtual = another.bolhaAtual;
    localizacaoAtual = another.localizacaoAtual;
    lastSearchResult = another.lastSearchResult;
    searchingTrack = another.searchingTrack;
    playlist = another.playlist;
    currentPlaying = another.currentPlaying;
    referenciasTamanhoBolha = another.referenciasTamanhoBolha;
    devices = another.devices;
    notificacaoMessages = another.notificacaoMessages;
    if (messages.length != another.messages.length) {
      chatMessages = List<ChatMessage>.from(
          another.messages.map((i) => i.toDashMessage()));
    }
    currentAppState = another.currentAppState;
    messages = another.messages;
  }
}
