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
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
                builder: (BuildContext context) => desejaEntrar(context));
          }
        },
        leading: Icon(
          Icons.bubble_chart,
          color: Colors.greenAccent,
        ),
        title: Text(bolha.apelido, style: Theme.of(context).textTheme.body1),
        subtitle: Text("1/∞"),
        trailing: PopupMenuButton<int>(
          onSelected: (selectedDropDownItem) {
            if (selectedDropDownItem == 1) {
              print("só entrar");
              showDialog(
                  context: context,
                  builder: (BuildContext context) => desejaEntrar(context));
            } else if (selectedDropDownItem == 2) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => desejaSair(context));
            }
          },
          itemBuilder: (context) => popupList(bolha),
        ),
      ),
    );
  }

  popupList(bolha) {
    var atual = store.state.bolhaAtual;
    List<PopupMenuEntry<int>> lista = [];

    if (atual == null || (atual != null ? atual.id != bolha.id : false)) {
      lista.add(
        PopupMenuItem(
          value: 1,
          child: Text("Entrar"),
        ),
      );
    }
    if (atual != null ? atual.id == bolha.id : false) {
      lista.add(PopupMenuItem(
        value: 2,
        child: Text("Sair"),
      ));
    }
    return lista;
  }

  desejaSair(BuildContext context) {
    return FancyDialog(
      ok: "Sim",
      cancel: "Cancelar...",
      gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
      title: "Sair da Bolha?",
      descreption: "Deseja realmente sair??",
      okFun: () async {
        BolhaApi.sairBolha();
        print("okfun!");
      },
      cancelFun: () {
        print("cancelFun");
      },
    );
  }

  desejaEntrar(BuildContext context) {
    return FancyDialog(
      ok: "Entrar",
      cancel: "Cancelar...",
      gifPath: "./assets/gifs/vetorizado-cat-bolha.gif",
      title: "Entrar na bolha?",
      descreption:
          "Ao entrar nessa bolha você sairá da bolha atual, caso esteja em uma.",
      okFun: () async {
        BolhaApi.entrarBolha(bolha.id);
        print("okfun!");
      },
      cancelFun: () {
        print("cancelFun");
      },
    );
  }
}
