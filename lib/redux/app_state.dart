import 'dart:convert';

import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/serializers.dart';
import 'package:built_value/serializer.dart';

import '../model/Me.dart';
import '../model/Token.dart';

class AppState {
  AuthState authState = new AuthState();
  Me me = new Me();
  Token token = new Token();

  AppState();

  AppState.fromAppState(AppState another) {
    authState = another.authState;
    me = another.me;
    token = another.token;
  }

}
