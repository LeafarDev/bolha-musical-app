import 'package:bolha_musical/api/BolhaApi.dart';
import 'package:bolha_musical/model/Bolha.dart';
import 'package:bolha_musical/redux/store.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BolhaItem extends StatelessWidget {
  final double width;
  final double height;
  final Bolha bolha;

  const BolhaItem({Key key, this.width, this.height, this.bolha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: ListTile(
          onTap: () {
            if (store.state.bolhaAtual.id != bolha.id) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => _desejaEntrar(context));
            }
          },
          leading: Icon(
            Icons.bubble_chart,
            color: Color(int.parse(bolha.cor)),
          ),
          title: Text(
            bolha.apelido,
            style: TextStyle(color: _bolhaAtualColor(bolha)),
          ),
          subtitle: Text(
            "1/∞",
            style: TextStyle(color: _bolhaAtualColor(bolha)),
          ),
          trailing: PopupMenuButton<int>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (selectedDropDownItem) {
              if (selectedDropDownItem == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => _desejaEntrar(context));
              } else if (selectedDropDownItem == 2) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => _desejaSair(context));
              }
            },
            itemBuilder: (context) => _popupList(bolha),
          ),
        ),
      ),
    );
  }

  _popupList(bolha) {
    var atual = store.state.bolhaAtual;
    List<PopupMenuEntry<int>> lista = [];

    if (atual != null ) {
      if (atual.id == bolha.id) {
        lista.add(PopupMenuItem(
          value: 2,
          child: Text("Sair"),
        ));
      } else {
        lista.add(
          PopupMenuItem(
            value: 1,
            child: Text("Entrar"),
          ),
        );
      }
      return lista;
    }

    lista.add(
      PopupMenuItem(
        value: 1,
        child: Text("Entrar"),
      ),
    );
    return lista;
  }

  _bolhaAtualColor(bolha) {
    var atual = store.state.bolhaAtual;
    if (atual != null) {
      if (bolha.id == atual.id) {
        return Colors.yellowAccent;
      }
    }
    return Colors.white;
  }

  _desejaSair(BuildContext context) {
    return FancyDialog(
      ok: "Sim",
      cancel: "Cancelar...",
      gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
      title: "Sair da Bolha?",
      descreption: "Deseja realmente sair??",
      okFun: () async {
        BolhaApi.sairBolha();
      },
      cancelFun: () {},
    );
  }

  _desejaEntrar(BuildContext context) {
    return FancyDialog(
      ok: "Entrar",
      cancel: "Cancelar...",
      gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
      title: "Entrar na bolha?",
      descreption:
          "Ao entrar nessa bolha você sairá da bolha atual, caso esteja em uma.",
      okFun: () async {
        BolhaApi.entrarBolha(bolha.id);
      },
      cancelFun: () {},
    );
  }
}
