import 'package:bolha_musical/utils/NavigationService.dart';
import 'package:bolha_musical/utils/SetupLocator.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';

class ApiDialogs {
  static errorDialog(message) {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context,
        builder: (BuildContext context) => FancyDialog(
              cancel: "Cancelar...",
              gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
              title: "Erro...",
              descreption: message != null
                  ? message
                  : "Não consegui realizar esta operação...",
              cancelFun: () {
                print("cancelFun");
              },
            ));
  }

  static sucessoDialog(message) {
    showDialog(
        context: locator<NavigationService>()
            .navigatorKey
            .currentState
            .overlay
            .context,
        builder: (BuildContext context) => FancyDialog(
              cancel: "Cancelar...",
              gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
              title: "Feito!",
              descreption: message != null
                  ? message
                  : "Não consegui realizar esta operação...",
              cancelFun: () {
                print("cancelFun");
              },
            ));
  }
}
