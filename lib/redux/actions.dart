import 'package:bolha_musical/model/AuthState.dart';
import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/model/Token.dart';

class SetAuthState {
  final AuthState payload;

  SetAuthState(this.payload);
}

class SetToken {
  final Token payload;

  SetToken(this.payload);
}

class SetME {
  final Me payload;

  SetME(this.payload);
}
