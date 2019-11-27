import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/utils/getLocalToken.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';

import 'NavigationService.dart';

noAuthRedirect() async {
  Token localToken = await getLocalToken() as Token;
  if (localToken == null) {
    locator<NavigationService>().navigateTo('/login');
  }
}
