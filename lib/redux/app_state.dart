import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Bolha.dart';
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
      "https://profile-images.scdn.co/images/userprofile/default/817641f61b9543e2a0faf1e43ab86b447bd86c1d";

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
  }
}
