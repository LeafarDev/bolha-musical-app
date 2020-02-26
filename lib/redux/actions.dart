import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/MessageObj.dart';
import 'package:bolha_musical/model/ReferenciaTamanhoBolha.dart';
import 'package:bolha_musical/model/SearchTrackResult.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/model/Track.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SetAuthState {
  final AuthState payload;

  SetAuthState(this.payload);
}

class SetToken {
  final Token payload;

  SetToken(this.payload);
}

class SetME {
  final Me payload;

  SetME(this.payload);
}

class SetMessage {
  final MessageObj payload;

  SetMessage(this.payload);
}

class SetBolhaAtual {
  final Bolha payload;

  SetBolhaAtual(this.payload);
}

class SetLocalizacaoAtual {
  final Localizacao payload;

  SetLocalizacaoAtual(this.payload);
}

class SetCurrentBottomBarIndex {
  final int payload;

  SetCurrentBottomBarIndex(this.payload);
}

class SetBolhasDisponiveis {
  final List<Bolha> payload;

  SetBolhasDisponiveis(this.payload);
}

class SetReferenciasTamanhoBolha {
  final List<ReferenciaTamanhoBolha> payload;

  SetReferenciasTamanhoBolha(this.payload);
}

class setLastSearchResult {
  final SearchTrackResult payload;

  setLastSearchResult(this.payload);
}

class SetSearchingTrack {
  final bool payload;

  SetSearchingTrack(this.payload);
}

class SetPlaylist {
  final List<Track> payload;

  SetPlaylist(this.payload);
}

class SetCurrentPlaying {
  final Track payload;

  SetCurrentPlaying(this.payload);
}

class SetDevices {
  final List<Device> payload;

  SetDevices(this.payload);
}

class SetMessages {
  final List<MessageObj> payload;

  SetMessages(this.payload);
}

class SetNotificacaoMessages{
  final List<Message> payload;

  SetNotificacaoMessages(this.payload);
}

class SetCurrentAppState {
  final String payload;

  SetCurrentAppState(this.payload);
}

