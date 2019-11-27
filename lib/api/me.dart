import 'dart:io';

import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:http/http.dart' as http;

void getMe() async {

  final resMe = await http.get("http://10.0.0.108:3001/api/users/me",
      headers: {HttpHeaders.authorizationHeader: store.state.token.token});
  if (resMe.statusCode == 200) {
    print("_me");
    print(resMe.body);
    Me me = Me.fromJson(resMe.body);
    store.dispatch(SetME(me));
  } else {
    print("falhou feio");
    print(resMe);
  }
}
