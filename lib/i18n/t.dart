import 'package:bolha_musical/model/Me.dart';
import 'package:bolha_musical/redux/store.dart';

import 'en.i18n.dart';
import 'pt.i18n.dart';

class t {
  static translate() {
    Me me = store.state.me;
    if (me == null) {
      return new En();
    } else {
      if (me.language_code == ":pt-br") {
        return new Pt();
      } else {
        return new En();
      }
    }
  }
}
