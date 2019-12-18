import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NavigationService.dart';
import 'getLocalToken.dart';

class UsersSessaoUtils {
  static inicializarSessaoComToken() async {
    Token localToken = await getLocalToken() as Token;
    if (localToken != null) {
      _setSessionToken(localToken);
    }
  }

  static _setSessionToken(token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      store.dispatch(SetToken(token));
      var me = await UsersSessaoUtils.getMeFromTokenAndStore();
      prefs.setString('token', token.toJson());
      // state só pode ser utilizado uma vez
      AuthState authstate = await UsersApi.getAuthState();
      if (authstate != null) {
        store.dispatch(SetAuthState(authstate));
      }

      var ping = await UsersApi.ping();

      if (!ping) {
        throw "Falha ao conversar com a api";
      }

      Navigator.pushNamed(
          locator<NavigationService>()
              .navigatorKey
              .currentState
              .overlay
              .context,
          '/mapa');
    } catch (error) {
      // TODO AVISAR USUÁRIO QUE DEU ERRO
      final prefs = await SharedPreferences.getInstance();
      print(error.toString());
      store.dispatch(SetAuthState(new AuthState()));
      store.dispatch(SetME(new Me()));
      store.dispatch(SetToken(new Token()));
      store.dispatch(SetAuthState(new AuthState()));
      prefs.remove('token');
      prefs.remove('me');
      Navigator.popAndPushNamed(
          locator<NavigationService>()
              .navigatorKey
              .currentState
              .overlay
              .context,
          '/');
    }
  }

  static inicializarSessaoComState() async {
    if (store.state.authState.id != null) {
      Token token = await UsersApi.getToken();
      if (token != null) {
        _setSessionToken(token);
      }
    }
  }

  static getMeFromTokenAndStore() async {
    final prefs = await SharedPreferences.getInstance();
    var mePrefs = prefs.getString('me') ?? null;
    if (mePrefs == null) {
      Me me = await UsersApi.getMe();
      if (me != null) {
        prefs.setString('me', me.toJson());
        store.dispatch(SetME(me));
      } else {
        throw "Impossivel acionar me: getMeFromTokenAndStore";
      }
    } else {
      Me me = Me.fromJson(mePrefs);
      store.dispatch(SetME(me));
    }
  }
}
