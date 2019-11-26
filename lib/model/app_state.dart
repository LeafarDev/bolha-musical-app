import 'package:bolha_musical/model/AuthState.dart';
import 'package:flutter/material.dart';

import 'Me.dart';
import 'Token.dart';

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
