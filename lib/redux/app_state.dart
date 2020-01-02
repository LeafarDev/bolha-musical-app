import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/model/Device.dart';
import 'package:bolha_musical/model/Localizacao.dart';
import 'package:bolha_musical/model/Message.dart';
import 'package:bolha_musical/model/SearchTrackResult.dart';
import 'package:bolha_musical/model/Track.dart';

import '../model/Me.dart';
import '../model/Token.dart';

class AppState {
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
  List<Message> messages = [
    Message.fromJson('''{"text":"Is really that time ?",
    "isLiked": true,
    "time": "20/08/2018 14:33",
    "sender":{
  "display_name":"JMWizzler",
  "email":"email@example.com",
  "external_urls":{
  "spotify":"https://open.spotify.com/user/wizzler"
  },
  "href":"https://api.spotify.com/v1/users/wizzler",
  "id":"wizzler",
  "images":[{
  "height":null,
  "url":"https://fbcdn...2330_n.jpg",
  "width":null
  }],
  "product":"premium",
  "type":"user",
  "uri":"spotify:user:wizzler"
}}'''),
    Message.fromJson('''{"text":"Is really that time ?",
    "isLiked": true,
    "time": "20/08/2018 14:33",
    "sender":{
  "display_name":"JMWizzler",
  "email":"email@example.com",
  "external_urls":{
  "spotify":"https://open.spotify.com/user/wizzler"
  },
  "href":"https://api.spotify.com/v1/users/wizzler",
  "id":"wizzler",
  "images":[{
  "height":null,
  "url":"https://fbcdn...2330_n.jpg",
  "width":null
  }],
  "product":"premium",
  "type":"user",
  "uri":"spotify:user:wizzler"
}}'''),
    Message.fromJson('''{"text":"Is really that time ?",
    "isLiked": true,
    "time": "20/08/2018 14:33",
    "sender":{
  "display_name":"JMWizzler",
  "email":"email@example.com",
  "external_urls":{
  "spotify":"https://open.spotify.com/user/wizzler"
  },
  "href":"https://api.spotify.com/v1/users/wizzler",
  "id":"wizzler",
  "images":[{
  "height":null,
  "url":"https://fbcdn...2330_n.jpg",
  "width":null
  }],
  "product":"premium",
  "type":"user",
  "uri":"spotify:user:wizzler"
}}'''),
    Message.fromJson('''{"text":"Is really that time ?",
    "isLiked": true,
    "time": "20/08/2018 14:33",
    "sender":{
  "display_name":"JMWizzler",
  "email":"email@example.com",
  "external_urls":{
  "spotify":"https://open.spotify.com/user/wizzler"
  },
  "href":"https://api.spotify.com/v1/users/wizzler",
  "id":"wizzler",
  "images":[{
  "height":null,
  "url":"https://fbcdn...2330_n.jpg",
  "width":null
  }],
  "product":"premium",
  "type":"user",
  "uri":"spotify:user:wizzler"
}}'''),
    Message.fromJson('''{"text":"Is really that time ?",
    "isLiked": true,
    "time": "20/08/2018 14:33",
    "sender":{
  "display_name":"JMWizzler",
  "email":"email@example.com",
  "external_urls":{
  "spotify":"https://open.spotify.com/user/wizzler"
  },
  "href":"https://api.spotify.com/v1/users/wizzler",
  "id":"wizzler",
  "images":[{
  "height":null,
  "url":"https://fbcdn...2330_n.jpg",
  "width":null
  }],
  "product":"premium",
  "type":"user",
  "uri":"spotify:user:wizzler"
}}''')
  ];
  String padraoPerfilFoto =
      "https://scontent-gru1-1.xx.fbcdn.net/v/t31.0-1/c47.0.160.160a/p160x160/10506738_10150004552801856_220367501106153455_o.jpg?_nc_cat=1&_nc_ohc=IPx3jo13vcMAQkPVjXxdnCBWbyWPNrV9Ja1GpNbHMk_tDGVrjWwdKmXuQ&_nc_ht=scontent-gru1-1.xx&oh=c6a0c59f4aad554cc29fa09ec49220a5&oe=5E75F250";

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
    devices = another.devices;
  }
}
