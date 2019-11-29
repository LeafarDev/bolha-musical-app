import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
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
      UsersSessaoUtils.getMeFromTokenAndStore();
      prefs.setString('token', token.toJson());
      print("/mapa, fodasi kakakak");
      locator<NavigationService>().navigateTo('/mapa');
    } catch (error) {
      // TODO AVISAR USUÁRIO QUE DEU ERRO
      final prefs = await SharedPreferences.getInstance();
      print("TODO AVISAR USUÁRIO QUE DEU ERRO");
      print(error.toString());
      store.dispatch(SetAuthState(new AuthState()));
      store.dispatch(SetME(new Me()));
      store.dispatch(SetToken(new Token()));
      prefs.setString('token', null);
      locator<NavigationService>().navigateTo('/login');
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
    Me me = await UsersApi.getMe();
    if (me != null) {
      store.dispatch(SetME(me));
    } else {
      throw "Impossivel acioar me: getMeFromTokenAndStore";
    }
  }
}
