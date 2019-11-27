import 'package:bolha_musical/model/Token.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getLocalToken() async {
  final prefs = await SharedPreferences.getInstance();
  String tokenStr = prefs.getString('token') ?? null;
  if (tokenStr != null) {
    Token tokenDto = Token.fromJson(tokenStr);
    store.dispatch(SetToken(tokenDto));
    return tokenDto;
  }
  return null;
}
