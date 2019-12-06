import 'package:bolha_musical/api/UsersApi.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:bolha_musical/utils/getLocalToken.dart';
import 'package:flutter/cupertino.dart';

import 'NavigationService.dart';

noAuthRedirect() async {
  Token localToken = await getLocalToken() as Token;
  Me me = await UsersApi.getMe();
  if (localToken == null || me == null) {
    print(me);
    Navigator.popAndPushNamed(
        locator<NavigationService>().navigatorKey.currentState.overlay.context,
        '/');
  }
}
